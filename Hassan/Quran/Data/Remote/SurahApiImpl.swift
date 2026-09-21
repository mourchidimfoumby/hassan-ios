//
//  SurahApiImpl.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import FirebaseFirestore

class SurahApiImpl: SurahApi {
    private let surahCollection = Firestore.firestore().collection(FirestoreCollectionReferences.surahs)
    private let surahTranslationCollection = Firestore.firestore().collection(FirestoreCollectionReferences.surahTranslations)

    func getSurahs() async throws -> [RemoteSurah] {
        let snapshot = try await surahCollection.getDocuments(source: FirestoreSource.server)
        return try snapshot.documents.map { value in
            try value.data(as: RemoteSurah.self)
        }
    }
    
    func getSurahTranslations(language: String) async throws -> [RemoteSurahTranslation] {
        try await surahTranslationCollection.document(language)
            .getDocument(source: FirestoreSource.server)
            .data(as: RemoteSurahTranslations.self)
            .values
    }
}
