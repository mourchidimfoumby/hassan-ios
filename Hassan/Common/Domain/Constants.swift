//
//  Constants.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 13/09/2026.
//

struct Constants {
    static let totalQuranSurahs = 114
    static let totalQuranVerses = 6236
    static let totalQuranPages = 604
    static let totalQuranJuz = 30
    static let totalQuranHizb = 60
    static let defaultSurahVersePreferences = SurahVersePreferences(
        displayMode: SurahVersePreferences.DisplayMode.list,
        displayTajweed: false,
        translationLanguage: nil,
        displayTransliteration: false,
        displayTranslation: true,
        reciter: nil,
        audioAutomaticScrolling: true,
        surahVerseBookmark: nil
    )
}
