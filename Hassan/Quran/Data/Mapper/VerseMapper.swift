//
//  VerseMapper.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

extension RemoteVerse {
    func toVerse() -> Verse {
        Verse(
            verseNumber: number,
            surahNumber: surahNumber,
            text: text,
            transliteration: transliteration,
            page: page,
            juzNumber: juz,
            hizbNumber: hizb
        )
    }
}

extension LocalVerse {
    func toVerse() -> Verse {
        Verse(
            verseNumber: verseNumber,
            surahNumber: surahNumber,
            text: text,
            transliteration: transliteration,
            page: page,
            juzNumber: juzNumber,
            hizbNumber: hizbNumber
        )
    }
}

extension LocalVerseModel {
    func toLocalVerse() -> LocalVerse? {
        guard let verseText,
              let verseTransliteration
        else { return nil }
        
        return LocalVerse(
            verseNumber: Int(verseNumber),
            surahNumber: Int(verseSurahNumber),
            text: verseText,
            transliteration: verseTransliteration,
            page: Int(versePage),
            juzNumber: Int(verseJuzNumber),
            hizbNumber: Int(verseHizbNumber)
        )
    }
}

extension Verse {
    func toLocal() -> LocalVerse {
        LocalVerse(
            verseNumber: verseNumber,
            surahNumber: surahNumber,
            text: text,
            transliteration: transliteration,
            page: page,
            juzNumber: juzNumber,
            hizbNumber: hizbNumber
        )
    }
}
