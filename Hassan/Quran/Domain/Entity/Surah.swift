//
//  Surah.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

struct Surah: Codable, Hashable {
    let number: Int
    let name: String
    let transliteration: String
    let type: String
    let totalVerses: Int
    let translation: String
}
