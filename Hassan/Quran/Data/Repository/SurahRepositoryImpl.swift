//
//  SurahRepositoryImpl.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

import Combine

private let tag = String(describing: SurahRepositoryImpl.self)

class SurahRepositoryImpl: SurahRepository {
    private let surahLocalDataSource: SurahLocalDataSource
    private let surahRemoteDataSource: SurahRemoteDataSource
    
    init(
        surahLocalDataSource: SurahLocalDataSource,
        surahRemoteDataSource: SurahRemoteDataSource
    ) {
        self.surahLocalDataSource = surahLocalDataSource
        self.surahRemoteDataSource = surahRemoteDataSource
    }
    
    func getSurahs() -> AnyPublisher<[Surah], Never> {
        surahLocalDataSource.getSurahs()
    }
    
    func getSurah(surahNumber: Int) async -> Surah? {
        do {
            return try await surahLocalDataSource.getSurah(surahNumber: surahNumber)
        } catch {
            e(tag, "Error geting local surah \(surahNumber)", error)
            return nil
        }
    }
    
    func getSurahCount() async -> Int {
        do {
            return try await surahLocalDataSource.getSurahCount()
        } catch {
            e(tag, "Error geting local surah count", error)
            return 0
        }
    }
    
    func searchSurah(name: String) async -> [Surah] {
        do {
            return try await surahLocalDataSource.searchSurah(name: name)
        } catch {
            e(tag, "Error searching local surah", error)
            return []
        }
    }
    
    func downloadSurahs(language: Language) async throws {
        let surahs = try await surahRemoteDataSource.getSurahs(language: language)
        try await surahLocalDataSource.upsertSurahs(surahs: surahs)
    }
}
