//
//  SurahVerseMapper.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

extension RemoteSurah {
    func toSurah(translation: String) -> Surah {
        Surah(
            number: number,
            name: name,
            transliteration: transliteration,
            type: type,
            totalVerses: totalVerses,
            translation: translation
        )
    }
}

extension LocalSurahModel {
    func toSurah() -> Surah? {
        guard let surahName,
              let surahTransliteration,
              let surahType,
              let surahTranslation
        else { return nil }
        
        return Surah(
            number: Int(surahNumber),
            name: surahName,
            transliteration: surahTransliteration,
            type: surahType,
            totalVerses: Int(surahTotalVerses),
            translation: surahTranslation
        )
    }
    
    func toLocalSurah() -> LocalSurah? {
        guard let surahName,
              let surahTransliteration,
              let surahType,
              let surahTranslation
        else { return nil }
        
        return LocalSurah(
            surahNumber: Int(surahNumber),
            surahName: surahName,
            surahTransliteration: surahTransliteration,
            surahType: surahType,
            surahTotalVerses: Int(surahTotalVerses),
            surahTranslation: surahTranslation
        )
    }
}

extension LocalSurah {
    func toSurah() -> Surah {
        Surah(
            number: surahNumber,
            name: surahName,
            transliteration: surahTransliteration,
            type: surahType,
            totalVerses: surahTotalVerses,
            translation: surahTranslation
        )
    }
}

extension Surah {
    func toLocalModel() -> LocalSurahModel {
        let localSurahModel = LocalSurahModel()
        
        localSurahModel.surahNumber = Int16(number)
        localSurahModel.surahName = name
        localSurahModel.surahTransliteration = transliteration
        localSurahModel.surahType = type
        localSurahModel.surahTotalVerses = Int16(totalVerses)
        localSurahModel.surahTranslation = translation
        
        return localSurahModel
    }
    
    func toLocal() -> LocalSurah {
        LocalSurah(
            surahNumber: number,
            surahName: name,
            surahTransliteration: transliteration,
            surahType: type,
            surahTotalVerses: totalVerses,
            surahTranslation: translation
        )
    }
}
