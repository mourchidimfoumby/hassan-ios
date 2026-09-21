//
//  QuranInjector.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Swinject

class QuranInjector: Injector {
    static var shared: Injector = QuranInjector()
    let container: Container
    
    private init() {
        container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        // Api
        container.register(SurahApi.self) { _ in
            SurahApiImpl()
        }.inObjectScope(.weak)
        
        container.register(VerseApi.self) { _ in
            VerseApiImpl()
        }.inObjectScope(.weak)
        
        // Data sources
        container.register(SurahLocalDataSource.self) { resolver in
            SurahLocalDataSource(hassanDatabaseContainer: CommonInjector.shared.resolve(HassanDatabaseContainer.self))
        }.inObjectScope(.weak)
        
        container.register(SurahRemoteDataSource.self) { resolver in
            SurahRemoteDataSource(surahApi: resolver.resolve(SurahApi.self)!)
        }.inObjectScope(.weak)
        
        container.register(SurahVerseLocalDataSource.self) { _ in
            SurahVerseLocalDataSource(hassanDatabaseContainer: CommonInjector.shared.resolve(HassanDatabaseContainer.self))
        }.inObjectScope(.weak)
        
        container.register(SurahVerseRemoteDataSource.self) { resolver in
            SurahVerseRemoteDataSource(verseApi: resolver.resolve(VerseApi.self)!)
        }.inObjectScope(.weak)
        
        container.register(SurahVersePreferencesLocalDataSource.self) { _ in
            SurahVersePreferencesLocalDataSource()
        }.inObjectScope(.weak)
        
        // Repositories
        container.register(SurahRepository.self) { resolver in
            SurahRepositoryImpl(
                surahLocalDataSource: resolver.resolve(SurahLocalDataSource.self)!,
                surahRemoteDataSource: resolver.resolve(SurahRemoteDataSource.self)!
            )
        }.inObjectScope(.container)
        
        container.register(SurahVerseRepository.self) { resolver in
            SurahVerseRepositoryImpl(
                surahVerseLocalDataSource: resolver.resolve(SurahVerseLocalDataSource.self)!,
                surahVerseRemoteDataSource: resolver.resolve(SurahVerseRemoteDataSource.self)!
            )
        }.inObjectScope(.container)
        
        container.register(SurahVersePreferencesRepository.self) { resolver in
            SurahVersePreferencesRepositoryImpl(
                surahVersePreferencesLocalDataSource: resolver.resolve(SurahVersePreferencesLocalDataSource.self)!
            )
        }.inObjectScope(.container)
        
        // Others
        container.register(InitSurahsTask.self) { resolver in
            InitSurahsTask(
                surahRepository: resolver.resolve(SurahRepository.self)!,
                getCurrentLanguageUseCase: CommonInjector.shared.resolve(GetCurrentLanguageUseCase.self)
            )
        }
        
        container.register(InitSurahVersePreferencesTask.self) { resolver in
            InitSurahVersePreferencesTask(
                surahVersePreferencesRepository: resolver.resolve(SurahVersePreferencesRepository.self)!
            )
        }
        
        container.register(InitSurahVersesTask.self) { resolver in
            InitSurahVersesTask(
                surahVerseRepository: resolver.resolve(SurahVerseRepository.self)!
            )
        }
        
        container.register(StartupQuranTask.self) { resolver in
            StartupQuranTask(
                networkMonitor: AppInjector.shared.resolve(NetworkMonitor.self),
                initSurahsTask: resolver.resolve(InitSurahsTask.self)!,
                initSurahVersePreferencesTask: resolver.resolve(InitSurahVersePreferencesTask.self)!,
                initSurahVersesTask: resolver.resolve(InitSurahVersesTask.self)!
            )
        }
    }
}
