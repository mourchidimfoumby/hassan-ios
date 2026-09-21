//
//  SurahLocalDataSource.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import Combine
import SwiftData

class SurahLocalDataSource {
    private let surahDataActor: SurahDataActor
    private let surahsSubject = PassthroughSubject<[Surah], Never>()

    init(hassanDatabaseContainer: HassanDatabaseContainer) {
        self.surahDataActor = SurahDataActor(context: hassanDatabaseContainer.container.newBackgroundContext())
    }
    
    func getSurahs() -> AnyPublisher<[Surah], Never> {
        let surahsFuture = Future<[Surah], Never> { promise in
            Task { [weak self] in
                let surahs = try? await self?.surahDataActor.getSurahs().compactMap { $0.toSurah() }
                promise(.success(surahs ?? []))
            }
        }
        
        return surahsSubject
            .prepend(surahsFuture)
            .eraseToAnyPublisher()
    }

    func getSurah(surahNumber: Int) async throws -> Surah? {
        try await surahDataActor.getSurah(surahNumber: surahNumber)?.toSurah()
    }

    func getSurahCount() async throws -> Int {
        try await surahDataActor.getSurahCount()
    }

    func searchSurah(name: String) async throws -> [Surah] {
        try await surahDataActor.searchSurah(name: name).compactMap { $0.toSurah() }
    }

    func upsertSurahs(surahs: [Surah]) async throws {
        for surah in surahs {
            try await surahDataActor.upsertSurah(surah: surah)
        }
        if let surahs = try? await surahDataActor.getSurahs().compactMap({ $0.toSurah() }) {
            surahsSubject.send(surahs)
        }
    }
}
