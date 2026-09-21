//
//  SurahRemoteDataSource.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import Combine

class SurahRemoteDataSource {
    private let surahApi: SurahApi
    
    init(surahApi: SurahApi) {
        self.surahApi = surahApi
    }
    
    func getSurahs(language: Language) async throws -> [Surah] {
        let surahs = try await surahApi.getSurahs()
        let surahTranslations = try await surahApi.getSurahTranslations(language: language.code).sorted { $0.number < $1.number }
        return surahs.map { surah in
            surah.toSurah(translation: surahTranslations[surah.number - 1].translation)
        }
    }
}
