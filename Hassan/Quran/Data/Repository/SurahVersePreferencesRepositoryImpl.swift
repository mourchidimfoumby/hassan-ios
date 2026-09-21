//
//  SurahVersePreferencesRepositoryImpl.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import Combine

private let tag = String(describing: SurahVersePreferencesRepositoryImpl.self)

class SurahVersePreferencesRepositoryImpl: SurahVersePreferencesRepository {
    private let surahVersePreferencesLocalDataSource: SurahVersePreferencesLocalDataSource
    
    init(surahVersePreferencesLocalDataSource: SurahVersePreferencesLocalDataSource) {
        self.surahVersePreferencesLocalDataSource = surahVersePreferencesLocalDataSource
    }
    
    func getSurahVersePreferencesPublisher() -> AnyPublisher<SurahVersePreferences, Never> {
        surahVersePreferencesLocalDataSource.getSurahVersePreferencesPublisher()
    }
    
    func getSurahVersePreferences() -> SurahVersePreferences? {
        surahVersePreferencesLocalDataSource.getSurahVersePreferences()
    }
    
    func setSurahVersePreferences(surahVersePreferences: SurahVersePreferences) {
        do {
            try surahVersePreferencesLocalDataSource.setSurahVersePreferences(surahVersePreferences: surahVersePreferences)
        } catch {
            e(tag, "Error setting local surah verse preferences", error)
        }
    }
}
