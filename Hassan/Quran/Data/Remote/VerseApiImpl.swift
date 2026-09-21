//
//  VerseApiImpl.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Combine
import FirebaseFirestore

class VerseApiImpl: VerseApi {
    private let surahVerseCollection = Firestore.firestore().collection(FirestoreCollectionReferences.surahVerses)
    
    func getAllVerses<T>(transform: @escaping (RemoteVerse) -> T) -> AsyncThrowingStream<[T], Error> {
        AsyncThrowingStream { continuation in
            Task { [weak self] in
                do {
                    let batchSize = 20
                    var lastDocument: DocumentSnapshot?

                    while true {
                        var query = self?.surahVerseCollection
                            .order(by: VersesField.Remote.values)
                            .limit(to: batchSize)

                        if let lastDocument {
                            query = query?.start(afterDocument: lastDocument)
                        }

                        guard let snapshot = try await query?.getDocuments(),
                              !snapshot.isEmpty else {
                            break
                        }

                        let data = snapshot.documents
                            .compactMap { try? $0.data(as: RemoteVerses.self) }
                            .flatMap { $0.values.map(transform) }

                        continuation.yield(data)

                        lastDocument = snapshot.documents.last

                        if snapshot.documents.count < batchSize {
                            break
                        }
                    }

                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
        }
    }


    func getVerses(surahNumber: Int) async throws -> [RemoteVerse] {
        try await surahVerseCollection.document(String(surahNumber))
            .getDocument()
            .data(as: RemoteVerses.self)
            .values
    }
}
