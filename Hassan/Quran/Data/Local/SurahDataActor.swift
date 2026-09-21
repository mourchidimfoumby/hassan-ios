//
//  SurahDataActor.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import Combine
import CoreData

actor SurahDataActor {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getSurahs() async throws -> [LocalSurahModel] {
        try await context.perform {
            let request = LocalSurahModel.fetchRequest()
            request.sortDescriptors = [
                NSSortDescriptor(
                    key: SurahField.Local.surahNumber,
                    ascending: true
                )
            ]
            return try self.context.fetch(request)
        }
    }

    func getSurah(surahNumber: Int) async throws -> LocalSurahModel? {
        try await context.perform {
            let request = LocalSurahModel.fetchRequest()
            request.predicate = NSPredicate(
                format: "%K == %d",
                SurahField.Local.surahNumber,
                surahNumber
            )
            return try self.context.fetch(request).first
        }
    }

    func getSurahCount() async throws -> Int {
        let request = LocalSurahModel.fetchRequest()
        return try context.count(for: request)
    }

    func searchSurah(name: String) async throws -> [LocalSurahModel] {
        let request = LocalSurahModel.fetchRequest()
        request.predicate = NSPredicate(
            format: "%K CONTAINS[cd] %@",
            SurahField.Local.surahName,
            name
        )
        request.sortDescriptors = [
            NSSortDescriptor(
                key: SurahField.Local.surahNumber,
                ascending: true
            )
        ]
        return try self.context.fetch(request)
    }

    func upsertSurah(surah: Surah) async throws {
        try await context.perform {
            let request = LocalSurahModel.fetchRequest()
            request.predicate = NSPredicate(
                format: "%K == %d",
                SurahField.Local.surahNumber,
                surah.number
            )
            
            if let localSurahModel = try self.context.fetch(request).first {
                guard !localSurahModel.equals(surah) else { return }
                localSurahModel.update(surah)
            } else {
                let newLocalSurahModel = LocalSurahModel(context: self.context)
                surah.updateLocal(newLocalSurahModel)
            }
            
            try self.context.save()
        }
    }
}

private extension LocalSurahModel {
    func equals(_ surah: Surah) -> Bool {
        surah.name == surahName &&
        surah.number == surahNumber &&
        surah.transliteration == surahTranslation &&
        surah.type == surahType &&
        surah.totalVerses == surahTotalVerses &&
        surah.translation == surahTranslation
    }
    
    func update(_ surah: Surah) {
        surahNumber = Int16(surah.number)
        surahName = surah.name
        surahTransliteration = surah.transliteration
        surahType = surah.type
        surahTotalVerses = Int16(surah.totalVerses)
        surahTranslation = surah.translation
    }
}

private extension Surah {
    func updateLocal(_ localSurahModel: LocalSurahModel) {
        localSurahModel.surahNumber = Int16(number)
        localSurahModel.surahName = name
        localSurahModel.surahTransliteration = transliteration
        localSurahModel.surahType = type
        localSurahModel.surahTotalVerses = Int16(totalVerses)
        localSurahModel.surahTranslation = translation
    }
}
