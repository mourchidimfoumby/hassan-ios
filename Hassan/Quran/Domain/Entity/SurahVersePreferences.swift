//
//  SurahVersePreferences.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

struct SurahVersePreferences: Copying {
    var displayMode: DisplayMode
    var displayTajweed: Bool
    var translationLanguage: Language?
    var displayTransliteration: Bool
    var displayTranslation: Bool
    var reciter: Reciter?
    var audioAutomaticScrolling: Bool
    var surahVerseBookmark: SurahVerse?
    
    enum  DisplayMode: String {
        case list = "list"
        case page = "page"
    }
}
