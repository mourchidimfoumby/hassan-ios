//
//  SurahVersePreferencesLocalDataSource.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import Combine
import Foundation

class SurahVersePreferencesLocalDataSource {
    private let surahVersePreferencesKey = "surahVersePreferencesKey"
    private let surahVersePreferencesSubject = PassthroughSubject<SurahVersePreferences?, Never>()

    func getSurahVersePreferencesPublisher() -> AnyPublisher<SurahVersePreferences, Never> {
        surahVersePreferencesSubject
            .prepend(getSurahVersePreferences())
            .compactMap(\.self)
            .eraseToAnyPublisher()
    }

    func getSurahVersePreferences() -> SurahVersePreferences? {
        guard let data = UserDefaults.standard.data(forKey: surahVersePreferencesKey) else {
            return nil
        }
        return try? JSONDecoder()
            .decode(LocalSurahVersePreferences.self, from: data)
            .toSurahVersePreferences()
    }
    
    func setSurahVersePreferences(surahVersePreferences: SurahVersePreferences) throws {
        let localSurahVersePreferencesJson = try JSONEncoder().encode(surahVersePreferences.toLocal())
        UserDefaults.standard.set(localSurahVersePreferencesJson, forKey: surahVersePreferencesKey)
    }
}
