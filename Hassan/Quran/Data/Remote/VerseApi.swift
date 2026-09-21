//
//  VerseApi.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Combine

protocol VerseApi {
    func getAllVerses<T>(transform: @escaping (RemoteVerse) -> T) -> AsyncThrowingStream<[T], Error>

    func getVerses(surahNumber: Int) async throws -> [RemoteVerse]
}
