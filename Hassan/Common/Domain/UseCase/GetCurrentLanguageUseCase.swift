//
//  GetCurrentLanguageUseCase.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 18/09/2026.
//

import Foundation

class GetCurrentLanguageUseCase {
    func execute() -> Language {
        if let language = Locale.preferredLanguages.first {
            Language.fromLanguageCode(String(language.prefix(2)))
        } else {
            Language.english
        }
    }
}
