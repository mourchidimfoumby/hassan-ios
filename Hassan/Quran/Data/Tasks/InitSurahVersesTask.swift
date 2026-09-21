//
//  InitSurahVersesTask.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 19/09/2026.
//

class InitSurahVersesTask {
    private let surahVerseRepository: SurahVerseRepository
    private let tag = String(describing: InitSurahsTask.self)
    
    init(surahVerseRepository: SurahVerseRepository) {
        self.surahVerseRepository = surahVerseRepository
    }

    func run() async {
        do {
            if (await surahVerseRepository.getVerseCount() < Constants.totalQuranVerses) {
                try await surahVerseRepository.downloadVerses()
            }
        } catch {
            e(tag, "Error init surah verses task", error)
        }
    }
}
