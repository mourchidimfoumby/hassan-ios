//
//  RemoteSurah.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

struct RemoteSurah: Decodable  {
    let number: Int
    let name: String
    let transliteration: String
    let type: String
    let totalVerses: Int
}
