//
//  RemoteSurahTranslation.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

struct RemoteSurahTranslation: Decodable {
    let number: Int
    let translation: String
}

struct RemoteSurahTranslations: Decodable {
    let values: [RemoteSurahTranslation]
}
