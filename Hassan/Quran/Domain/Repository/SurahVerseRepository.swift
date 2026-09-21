//
//  SurahVerseRepository.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Combine

protocol SurahVerseRepository {
    func getAllJuz() -> AnyPublisher<[Juz], Never>

    func getAllHizb() -> AnyPublisher<[Hizb], Never>

    func getSurahVersesFromSurah(surahNumber: Int, limit: Int) async -> [SurahVerse]

    func getSurahVersesFromJuz(juzNumber: Int, limit: Int) async -> [SurahVerse]

    func getSurahVersesFromHizb(hizbNumber: Int, limit: Int) async -> [SurahVerse]

    func getSurahVersesFromPage(page: Int) async -> [SurahVerse]

    func getSurahVerse(surahNumber: Int, verseNumber: Int) async -> SurahVerse?

    func getVerseCount() async -> Int

    func downloadVerses() async throws
}

extension SurahVerseRepository {
    func getSurahVersesFromSurah(surahNumber: Int, limit: Int = Int.max) async -> [SurahVerse] {
        await getSurahVersesFromSurah(surahNumber: surahNumber, limit: limit)
    }

    func getSurahVersesFromJuz(juzNumber: Int, limit: Int = Int.max) async -> [SurahVerse] {
        await getSurahVersesFromJuz(juzNumber: juzNumber, limit: limit)
    }

    func getSurahVersesFromHizb(hizbNumber: Int, limit: Int = Int.max) async -> [SurahVerse] {
        await getSurahVersesFromHizb(hizbNumber: hizbNumber, limit: limit)
    }
}
