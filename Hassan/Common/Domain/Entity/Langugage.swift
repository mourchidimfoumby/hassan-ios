//
//  Language.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

enum Language: String {
    case english = "english"
    case french = "french"
    
    var code: String {
        switch self {
            case .english: "en"
            case .french: "fr"
        }
    }
    
    static func fromLanguageCode(_ code: String) -> Language {
        switch code {
            case Language.english.code: Language.english
            case Language.french.code: Language.french
            default: Language.english
        }
    }
}
