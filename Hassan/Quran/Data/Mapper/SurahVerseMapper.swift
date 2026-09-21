//
//  SurahVerseMapper.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

extension LocalSurahVerse {
    func toSurahVerse() -> SurahVerse {
        SurahVerse(
            surah: surah.toSurah(),
            verse: verse.toVerse()
        )
    }
}
