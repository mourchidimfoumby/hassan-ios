//
//  SurahVerseRepositoryImpl.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Combine

private let tag = String(describing: SurahVerseRepositoryImpl.self)

class SurahVerseRepositoryImpl: SurahVerseRepository {
    private let surahVerseLocalDataSource: SurahVerseLocalDataSource
    private let surahVerseRemoteDataSource: SurahVerseRemoteDataSource
    
    init(
        surahVerseLocalDataSource: SurahVerseLocalDataSource,
        surahVerseRemoteDataSource: SurahVerseRemoteDataSource
    ) {
        self.surahVerseLocalDataSource = surahVerseLocalDataSource
        self.surahVerseRemoteDataSource = surahVerseRemoteDataSource
    }
    
    func getAllJuz() -> AnyPublisher<[Juz], Never> {
        surahVerseLocalDataSource.getAllJuz()
    }
    
    func getAllHizb() -> AnyPublisher<[Hizb], Never> {
        surahVerseLocalDataSource.getAllHizb()
    }
    
    func getSurahVersesFromPage(page: Int) async -> [SurahVerse] {
        do {
            return try await surahVerseLocalDataSource.getSurahVersesFromPage(page: page)
        } catch {
            e(tag, "Error geting local surah verse from page : \(page)", error)
            return []
        }
    }
    
    func getSurahVerse(surahNumber: Int, verseNumber: Int) async -> SurahVerse? {
        do {
            return try await surahVerseLocalDataSource.getSurahVerse(surahNumber: surahNumber, verseNumber: verseNumber)
        } catch {
            e(tag, "Error geting local surah verse : \(surahNumber):\(verseNumber)", error)
            return nil
        }
    }
    
    func getVerseCount() async -> Int {
        do {
            return try await surahVerseLocalDataSource.getVerseCount()
        } catch {
            e(tag, "Error geting local verse count", error)
            return 0
        }
    }
    
    func downloadVerses() async throws {
        do {
            for try await verses in surahVerseRemoteDataSource.getAllVerses() {
                try await surahVerseLocalDataSource.upsertVerses(verses: verses)
            }
        } catch {
            e(tag, "Error downloading surah verse", error)
            throw error
        }
    }
}
