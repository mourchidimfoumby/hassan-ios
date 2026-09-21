//
//  SurahVerseLocalDataSource.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Combine

class SurahVerseLocalDataSource {
    private let surahVerseDataActor: SurahVerseDataActor
    private let juzSubject = PassthroughSubject<[Juz], Never>()
    private let hizbSubject = PassthroughSubject<[Hizb], Never>()

    init(hassanDatabaseContainer: HassanDatabaseContainer) {
        self.surahVerseDataActor = SurahVerseDataActor(context: hassanDatabaseContainer.container.newBackgroundContext())
    }
    
    func getAllJuz() -> AnyPublisher<[Juz], Never> {
        let juzFuture = Future<[Juz], Never> { promise in
            Task { [weak self] in
                let juz = try? await self?.surahVerseDataActor.getAllJuz().compactMap { $0.toJuz() }
                promise(.success(juz ?? []))
            }
        }
        
        return juzSubject
            .prepend(juzFuture)
            .eraseToAnyPublisher()
    }

    func getAllHizb() -> AnyPublisher<[Hizb], Never> {
        let hizbFuture = Future<[Hizb], Never> { promise in
            Task { [weak self] in
                let hizb = try? await self?.surahVerseDataActor.getAllHizb().compactMap { $0.toHizb() }
                promise(.success(hizb ?? []))
            }
        }
        
        return hizbSubject
            .prepend(hizbFuture)
            .eraseToAnyPublisher()
    }

    func getSurahVerseFromSurah(surahNumber: Int, limit: Int) async throws -> [SurahVerse] {
        try await surahVerseDataActor.getSurahVerseFromSurah(surahNumber: surahNumber, limit: limit).map { $0.toSurahVerse() }
    }

    func getSurahVersesFromJuz(juzNumber: Int, limit: Int) async throws -> [SurahVerse] {
        try await surahVerseDataActor.getSurahVersesFromJuz(juzNumber: juzNumber, limit: limit).map { $0.toSurahVerse() }
    }

    func getSurahVersesFromHizb(hizbNumber: Int, limit: Int) async throws -> [SurahVerse] {
        try await surahVerseDataActor.getSurahVersesFromHizb(hizbNumber: hizbNumber, limit: limit).map { $0.toSurahVerse() }
    }

    func getSurahVersesFromPage(page: Int) async throws -> [SurahVerse] {
        try await surahVerseDataActor.getSurahVersesFromPage(page: page).map { $0.toSurahVerse() }
    }

    func getSurahVerse(surahNumber: Int, verseNumber: Int) async throws -> SurahVerse? {
        try await surahVerseDataActor.getSurahVerse(surahNumber: surahNumber, verseNumber: verseNumber)?.toSurahVerse()
    }

    func getVerseCount() async throws -> Int {
        try await surahVerseDataActor.getVerseCount()
    }

    func upsertVerses(verses: [Verse]) async throws {
        for verse in verses {
            try await surahVerseDataActor.upsertVerse(verse: verse)
        }
        if let allJuz = try? await surahVerseDataActor.getAllJuz().compactMap({ $0.toJuz() }) {
            juzSubject.send(allJuz)
        }
        if let allHizb = try? await surahVerseDataActor.getAllHizb().compactMap({ $0.toHizb() }) {
            hizbSubject.send(allHizb)
        }
    }
}
