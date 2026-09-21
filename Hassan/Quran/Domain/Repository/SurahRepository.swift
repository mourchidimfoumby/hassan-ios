//
//  SurahRepository.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

import Combine

protocol SurahRepository {
    func getSurahs() -> AnyPublisher<[Surah], Never>

    func getSurah(surahNumber: Int) async -> Surah?

    func getSurahCount() async -> Int

    func searchSurah(name: String) async -> [Surah]

    func downloadSurahs(language: Language) async throws
}
