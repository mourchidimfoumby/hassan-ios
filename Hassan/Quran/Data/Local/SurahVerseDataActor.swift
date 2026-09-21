//
//  SurahVerseDataActor.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Combine
import CoreData

actor SurahVerseDataActor {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getAllJuz() async throws -> [LocalJuz] {
        try await context.perform {
            let verseRequest = LocalVerseModel.fetchRequest()
            verseRequest.sortDescriptors = [
                NSSortDescriptor(key: VerseField.Local.verseSurahNumber, ascending: true),
                NSSortDescriptor(key: VerseField.Local.verseNumber, ascending: true)
            ]
            let localVerses = try self.context.fetch(verseRequest)
            
            let surahRequest = LocalSurahModel.fetchRequest()
            surahRequest.sortDescriptors = [
                NSSortDescriptor(key: SurahField.Local.surahNumber, ascending: true)
            ]
            let localSurahs = try self.context.fetch(surahRequest)
            
            let filteredLocalVerses = Dictionary(grouping: localVerses, by: { $0.verseJuzNumber })
                .compactMap { (_, value) in value.first }
                .sorted {
                    if $0.verseSurahNumber != $1.verseSurahNumber {
                        return $0.verseSurahNumber < $1.verseSurahNumber
                    }
                    return $0.verseNumber < $1.verseNumber
                }
            
            return filteredLocalVerses.compactMap { verse in
                guard let firstSurah = localSurahs.getOrNull(Int(verse.verseSurahNumber) - 1)?.toLocalSurah(),
                      let firstVerse = verse.toLocalVerse()
                else { return nil }
                
                return LocalJuz(
                    number: Int(verse.verseJuzNumber),
                    firstSurah: firstSurah,
                    firstVerse: firstVerse
                )
            }
        }
    }

    func getAllHizb() async throws -> [LocalHizb] {
        try await context.perform {
            let verseRequest = LocalVerseModel.fetchRequest()
            verseRequest.sortDescriptors = [
                NSSortDescriptor(key: VerseField.Local.verseSurahNumber, ascending: true),
                NSSortDescriptor(key: VerseField.Local.verseNumber, ascending: true)
            ]
            let localVerses = try self.context.fetch(verseRequest)
            
            let surahRequest = LocalSurahModel.fetchRequest()
            surahRequest.sortDescriptors = [
                NSSortDescriptor(key: SurahField.Local.surahNumber, ascending: true)
            ]
            let localSurahs = try self.context.fetch(surahRequest)
            
            let filteredLocalVerses = Dictionary(grouping: localVerses, by: { $0.verseHizbNumber })
                .compactMap { (_, value) in value.first }
                .sorted {
                    if $0.verseSurahNumber != $1.verseSurahNumber {
                        return $0.verseSurahNumber < $1.verseSurahNumber
                    }
                    return $0.verseNumber < $1.verseNumber
                }
            
            return filteredLocalVerses.compactMap { verse in
                guard let firstSurah = localSurahs.getOrNull(Int(verse.verseSurahNumber) - 1)?.toLocalSurah(),
                      let firstVerse = verse.toLocalVerse()
                else { return nil }
                
                return LocalHizb(
                    number: Int(verse.verseHizbNumber),
                    firstSurah: firstSurah,
                    firstVerse: firstVerse
                )
            }
        }
    }

    func getSurahVerseFromSurah(surahNumber: Int, limit: Int) async throws -> [LocalSurahVerse] {
        try await context.perform {
            let request = LocalVerseModel.fetchRequest()
            request.predicate = NSPredicate(
                format: "%K == %d",
                VerseField.Local.verseSurahNumber,
                surahNumber
            )
            request.sortDescriptors = [
                NSSortDescriptor(key: VerseField.Local.verseSurahNumber, ascending: true),
                NSSortDescriptor(key: VerseField.Local.verseNumber, ascending: true)
            ]
            request.fetchLimit = limit
            let verses = try self.context.fetch(request)
            
            let surahRequest = LocalSurahModel.fetchRequest()
            request.predicate = NSPredicate(
                format: "%K == %d",
                SurahField.Local.surahNumber,
                surahNumber
            )
            let surah = try self.context.fetch(surahRequest).first
            
            return verses.compactMap { verse in
                guard let surah = surah?.toLocalSurah(),
                      let verse = verse.toLocalVerse()
                else { return nil }
                
                return LocalSurahVerse(
                    surah: surah,
                    verse: verse
                )
            }
        }
    }

    func getSurahVersesFromJuz(juzNumber: Int, limit: Int) async throws -> [LocalSurahVerse] {
        try await context.perform {
            let request = LocalVerseModel.fetchRequest()
            request.predicate = NSPredicate(
                format: "%K == %d",
                VerseField.Local.verseJuz,
                juzNumber
            )
            request.sortDescriptors = [
                NSSortDescriptor(key: VerseField.Local.verseSurahNumber, ascending: true),
                NSSortDescriptor(key: VerseField.Local.verseNumber, ascending: true)
            ]
            request.fetchLimit = limit
            let verses = try self.context.fetch(request)
            let surahNumbers = Dictionary(grouping: verses, by: { $0.verseSurahNumber })
                .map { (key, value) in key }
            
            let surahRequest = LocalSurahModel.fetchRequest()
            let predicates = surahNumbers.map { number in
                NSPredicate(
                    format: "%K == %d",
                    SurahField.Local.surahNumber,
                    number
                )
            }
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
            let surahs = try self.context.fetch(surahRequest)
            
            return verses.compactMap { verse in
                guard let surah = surahs.getOrNull(Int(verse.verseNumber - 1))?.toLocalSurah(),
                      let verse = verse.toLocalVerse()
                else { return nil }
                
                return LocalSurahVerse(
                    surah: surah,
                    verse: verse
                )
            }
        }
    }

    func getSurahVersesFromHizb(hizbNumber: Int, limit: Int) async throws -> [LocalSurahVerse] {
        try await context.perform {
            let request = LocalVerseModel.fetchRequest()
            request.predicate = NSPredicate(
                format: "%K == %d",
                VerseField.Local.verseHizb,
                hizbNumber
            )
            request.sortDescriptors = [
                NSSortDescriptor(key: VerseField.Local.verseSurahNumber, ascending: true),
                NSSortDescriptor(key: VerseField.Local.verseNumber, ascending: true)
            ]
            request.fetchLimit = limit
            let verses = try self.context.fetch(request)
            let surahNumbers = Dictionary(grouping: verses, by: { $0.verseSurahNumber })
                .map { (key, value) in key }
            
            let surahRequest = LocalSurahModel.fetchRequest()
            let predicates = surahNumbers.map { number in
                NSPredicate(
                    format: "%K == %d",
                    SurahField.Local.surahNumber,
                    number
                )
            }
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
            let surahs = try self.context.fetch(surahRequest)
            
            return verses.compactMap { verse in
                guard let surah = surahs.getOrNull(Int(verse.verseNumber - 1))?.toLocalSurah(),
                      let verse = verse.toLocalVerse()
                else { return nil }
                
                return LocalSurahVerse(
                    surah: surah,
                    verse: verse
                )
            }
        }
    }

    func getSurahVersesFromPage(page: Int) async throws -> [LocalSurahVerse] {
        try await context.perform {
            let request = LocalVerseModel.fetchRequest()
            request.predicate = NSPredicate(
                format: "%K == %d",
                VerseField.Local.versePage,
                page
            )
            request.sortDescriptors = [
                NSSortDescriptor(key: VerseField.Local.verseSurahNumber, ascending: true),
                NSSortDescriptor(key: VerseField.Local.verseNumber, ascending: true)
            ]
            let verses = try self.context.fetch(request)
            let surahNumbers = Dictionary(grouping: verses, by: { $0.verseSurahNumber })
                .map { (key, value) in key }
            
            let surahRequest = LocalSurahModel.fetchRequest()
            let predicates = surahNumbers.map { number in
                NSPredicate(
                    format: "%K == %d",
                    SurahField.Local.surahNumber,
                    number
                )
            }
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
            let surahs = try self.context.fetch(surahRequest)
            
            return verses.compactMap { verse in
                guard let surah = surahs.getOrNull(Int(verse.verseNumber - 1))?.toLocalSurah(),
                      let verse = verse.toLocalVerse()
                else { return nil }
                
                return LocalSurahVerse(
                    surah: surah,
                    verse: verse
                )
            }
        }
    }

    func getSurahVerse(surahNumber: Int, verseNumber: Int) async throws -> LocalSurahVerse? {
        try await context.perform {
            let verseRequest = LocalVerseModel.fetchRequest()
            verseRequest.predicate = NSPredicate(
                format: "%K == %d AND %K == %d",
                VerseField.Local.verseSurahNumber,
                surahNumber,
                VerseField.Local.verseNumber,
                verseNumber
            )
            let verse = try self.context.fetch(verseRequest).first?.toLocalVerse()
            
            let surahRequest = LocalSurahModel.fetchRequest()
            surahRequest.predicate = NSPredicate(
                format: "%K == %d",
                SurahField.Local.surahNumber,
                surahNumber
            )
            let surah = try self.context.fetch(surahRequest).first?.toLocalSurah()
            
            if let surah, let verse {
                return LocalSurahVerse(surah: surah, verse: verse)
            } else {
                return nil
            }
        }
    }

    func getVerseCount() async throws -> Int {
        let verseRequest = LocalVerseModel.fetchRequest()
        return try self.context.fetch(verseRequest).count
    }

    func upsertVerse(verse: Verse) async throws {
        try await context.perform {
            let request = LocalVerseModel.fetchRequest()
            request.predicate = NSPredicate(
                format: "%K == %d AND %K == %d",
                VerseField.Local.verseSurahNumber,
                verse.surahNumber,
                VerseField.Local.verseNumber,
                verse.verseNumber
            )
            
            if let localVerseModel = try self.context.fetch(request).first {
                guard !localVerseModel.equals(verse) else { return }
                localVerseModel.update(verse)
            } else {
                let newLocalVerseModel = LocalVerseModel(context: self.context)
                verse.updateLocal(newLocalVerseModel)
            }
            
            try self.context.save()
        }
    }
}

private extension LocalVerseModel {
    func equals(_ verse: Verse) -> Bool {
        verse.verseNumber == verseNumber &&
        verse.surahNumber == verseSurahNumber &&
        verse.text == verseText &&
        verse.transliteration == verseTransliteration &&
        verse.page == versePage &&
        verse.juzNumber == verseJuzNumber &&
        verse.hizbNumber == verseHizbNumber
    }
    
    func update(_ verse: Verse) {
        verseNumber = Int16(verse.verseNumber)
        verseSurahNumber = Int16(verse.surahNumber)
        verseText = verse.text
        verseTransliteration = verse.transliteration
        versePage = Int16(verse.page)
        verseJuzNumber = Int16(verse.juzNumber)
        verseHizbNumber = Int16(verse.hizbNumber)
    }
}

private extension Verse {
    func updateLocal(_ localVerseModel: LocalVerseModel) {
        localVerseModel.verseNumber = Int16(verseNumber)
        localVerseModel.verseSurahNumber = Int16(surahNumber)
        localVerseModel.verseText = text
        localVerseModel.verseTransliteration = transliteration
        localVerseModel.versePage = Int16(page)
        localVerseModel.verseJuzNumber = Int16(juzNumber)
        localVerseModel.verseHizbNumber = Int16(hizbNumber)
    }
}
