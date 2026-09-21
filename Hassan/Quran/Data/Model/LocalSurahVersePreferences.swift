//
//  LocalSurahVersePreferences.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

struct LocalSurahVersePreferences: Codable {
    let displayMode: String
    let translationLanguage: String?
    let displayTransliteration: Bool
    let displayTranslation: Bool
    let displayTajweed: Bool
    let reciter: String?
    let audioAutomaticScrolling: Bool
    let surahVerseBookmark: String?
}
