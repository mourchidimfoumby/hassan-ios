//
//  InitSurahsTask.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 18/09/2026.
//

class InitSurahsTask {
    private let surahRepository: SurahRepository
    private let getCurrentLanguageUseCase: GetCurrentLanguageUseCase
    private let tag = String(describing: InitSurahsTask.self)

    init(
        surahRepository: SurahRepository,
        getCurrentLanguageUseCase: GetCurrentLanguageUseCase
    ) {
        self.surahRepository = surahRepository
        self.getCurrentLanguageUseCase = getCurrentLanguageUseCase
    }

    func run() async {
        do {
            if (await surahRepository.getSurahCount() < Constants.totalQuranSurahs) {
                try await surahRepository.downloadSurahs(language: getCurrentLanguageUseCase.execute())
            }
        } catch {
            e(tag, "Error downloading surahs", error)
        }
    }
}
