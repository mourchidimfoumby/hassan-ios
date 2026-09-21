//
//  SurahVerseRemoteDataSource.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Combine

class SurahVerseRemoteDataSource {
    private let verseApi: VerseApi
    
    init(verseApi: VerseApi) {
        self.verseApi = verseApi
    }
    
    func getAllVerses() -> AsyncThrowingStream<[Verse], Error> {
        verseApi.getAllVerses {
            $0.toVerse()
        }
    }

    func getVerses(surahNumber: Int) async throws -> [Verse] {
        try await verseApi.getVerses(surahNumber: surahNumber).map { $0.toVerse() }
    }
}
