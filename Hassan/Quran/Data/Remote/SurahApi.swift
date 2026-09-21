//
//  SurahApi.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

protocol SurahApi {
    func getSurahs() async throws -> [RemoteSurah]
    
    func getSurahTranslations(language: String) async throws -> [RemoteSurahTranslation]
}
