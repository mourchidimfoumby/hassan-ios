//
//  RemoteVerse.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

struct RemoteVerse: Decodable {
    let number: Int
    let surahNumber: Int
    let text: String
    let transliteration: String
    let page: Int
    let juz: Int
    let hizb: Int
}

struct RemoteVerses: Decodable {
    let values: [RemoteVerse]
}
