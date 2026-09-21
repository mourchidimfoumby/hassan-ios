//
//  InitSurahVersePreferencesTask.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 18/09/2026.
//

class InitSurahVersePreferencesTask {
    private let surahVersePreferencesRepository: SurahVersePreferencesRepository
    
    init(surahVersePreferencesRepository: SurahVersePreferencesRepository) {
        self.surahVersePreferencesRepository = surahVersePreferencesRepository
    }

    func run() {
        if (surahVersePreferencesRepository.getSurahVersePreferences() == nil) {
            surahVersePreferencesRepository.setSurahVersePreferences(surahVersePreferences: Constants.defaultSurahVersePreferences)
        }
    }
}
