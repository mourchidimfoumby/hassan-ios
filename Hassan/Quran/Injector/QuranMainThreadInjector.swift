//
//  QuranMainThreadInjector.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Swinject

class QuranMainThreadInjector: MainThreadInjector {
    let container: Container
    static var shared: MainThreadInjector = QuranMainThreadInjector()
    
    private init() {
        container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        // View models
        container.register(QuranNavigationViewModel.self) { _ in
            QuranNavigationViewModel()
        }
        
        container.register(QuranViewModel.self) { _ in
            QuranViewModel(
                surahRepository: QuranInjector.shared.resolve(SurahRepository.self),
                surahVerseRepository: QuranInjector.shared.resolve(SurahVerseRepository.self),
                surahVersePreferencesRepository: QuranInjector.shared.resolve(SurahVersePreferencesRepository.self)
            )
        }
    }
}
