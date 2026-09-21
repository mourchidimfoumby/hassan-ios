//
//  StartupQuranTask.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 18/09/2026.
//

class StartupQuranTask {
    private let networkMonitor: NetworkMonitor
    private let initSurahsTask: InitSurahsTask
    private let initSurahVersePreferencesTask: InitSurahVersePreferencesTask
    private let initSurahVersesTask: InitSurahVersesTask
    
    init(
        networkMonitor: NetworkMonitor,
        initSurahsTask: InitSurahsTask,
        initSurahVersePreferencesTask: InitSurahVersePreferencesTask,
        initSurahVersesTask: InitSurahVersesTask
    ) {
        self.networkMonitor = networkMonitor
        self.initSurahsTask = initSurahsTask
        self.initSurahVersePreferencesTask = initSurahVersePreferencesTask
        self.initSurahVersesTask = initSurahVersesTask
    }
    
    func run() {
        initSurahVersePreferencesTask.run()
        Task {
            _ = await networkMonitor.connected.values.first { $0 }
            try await Task.sleep(for: .seconds(1))
            await initSurahsTask.run()
            await initSurahVersesTask.run()
        }
    }
}
