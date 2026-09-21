//
//  Verse.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

struct Verse: Codable, Hashable {
    let verseNumber: Int
    let surahNumber: Int
    let text: String
    let transliteration: String
    let page: Int
    let juzNumber: Int
    let hizbNumber: Int
}
