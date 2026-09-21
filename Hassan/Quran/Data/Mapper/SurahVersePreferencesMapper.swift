//
//  SurahVersePreferencesMapper.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import Foundation

extension LocalSurahVersePreferences {
    func toSurahVersePreferences() -> SurahVersePreferences {
        let translationLanguage: Language? = if let translationLanguage {
            Language(rawValue: translationLanguage)
        } else {
            nil
        }
        
        return SurahVersePreferences(
            displayMode: SurahVersePreferences.DisplayMode(rawValue: displayMode) ?? SurahVersePreferences.DisplayMode.list,
            displayTajweed: displayTajweed,
            translationLanguage: translationLanguage,
            displayTransliteration: displayTransliteration,
            displayTranslation: displayTranslation,
            reciter: fromJson(reciter, type: LocalReciter.self)?.toReciter(),
            audioAutomaticScrolling: audioAutomaticScrolling,
            surahVerseBookmark: fromJson(surahVerseBookmark, type: LocalSurahVerse.self)?.toSurahVerse()
        )
    }
}

extension SurahVersePreferences {
    func toLocal() -> LocalSurahVersePreferences {
        LocalSurahVersePreferences(
            displayMode: displayMode.rawValue,
            translationLanguage: translationLanguage?.rawValue,
            displayTransliteration: displayTransliteration,
            displayTranslation: displayTranslation,
            displayTajweed: displayTajweed,
            reciter: toJson(reciter?.toLocal()),
            audioAutomaticScrolling: audioAutomaticScrolling,
            surahVerseBookmark: toJson(surahVerseBookmark)
        )
    }
}
