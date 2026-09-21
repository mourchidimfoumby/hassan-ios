//
//  JuzMapper.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

extension LocalJuz {
    func toJuz() -> Juz {
        Juz(
            number: number,
            firstSurahVerse: SurahVerse(
                surah: firstSurah.toSurah(),
                verse: firstVerse.toVerse()
            )
        )
    }
}

extension Juz {
    func toLocal() -> LocalJuz {
        LocalJuz(
            number: number,
            firstSurah: firstSurahVerse.surah.toLocal(),
            firstVerse: firstSurahVerse.verse.toLocal()
        )
    }
}
