//
//  SurahVersePreferencesRepository.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import Combine

protocol SurahVersePreferencesRepository {
    func getSurahVersePreferencesPublisher() -> AnyPublisher<SurahVersePreferences, Never>

    func getSurahVersePreferences() -> SurahVersePreferences?

    func setSurahVersePreferences(surahVersePreferences: SurahVersePreferences)
}
