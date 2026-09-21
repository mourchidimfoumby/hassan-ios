//
//  HizbMapper.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

import Foundation

extension LocalHizbModel {
    func toHizb() -> Hizb? {
        guard let hizbFirstSurah,
              let hizbFirstVerse,
              let firstSurahData = hizbFirstSurah.data(using: .utf8),
              let firstVerseData = hizbFirstVerse.data(using: .utf8),
              let localFirstSurah = try? JSONDecoder().decode(LocalSurah.self, from: firstSurahData),
              let localFirstVerse = try? JSONDecoder().decode(LocalVerse.self, from: firstVerseData)
        else { return nil }
        
        return Hizb(
            number: Int(hizbNumber),
            firstSurahVerse: LocalSurahVerse(
                surah: localFirstSurah,
                verse: localFirstVerse
            ).toSurahVerse()
        )
    }
}

extension LocalHizb {
    func toHizb() -> Hizb {
        Hizb(
            number: number,
            firstSurahVerse: LocalSurahVerse(
                surah: firstSurah,
                verse: firstVerse
            ).toSurahVerse()
        )
    }
}

extension Hizb {
    func toLocal() -> LocalHizbModel? {
        let localHizbModel = LocalHizbModel()
        guard let firstSurahData = try? JSONEncoder().encode(firstSurahVerse.surah.toLocal()),
              let firstVerseData = try? JSONEncoder().encode(firstSurahVerse.verse.toLocal()),
              let firstSurah = String(data: firstSurahData, encoding: .utf8),
              let firstVerse = String(data: firstVerseData, encoding: .utf8)
        else { return nil }
        
        localHizbModel.hizbNumber = Int16(number)
        localHizbModel.hizbFirstSurah = firstSurah
        localHizbModel.hizbFirstVerse = firstVerse
        
        return localHizbModel
    }
}
