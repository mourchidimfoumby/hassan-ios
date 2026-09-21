//
//  QuranViewModel.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Combine
import Foundation

class QuranViewModel: ViewModel {
    private let surahRepository: SurahRepository
    private let surahVerseRepository: SurahVerseRepository
    private let surahVersePreferencesRepository: SurahVersePreferencesRepository
    
    @Published private(set) var uiState = QuranUiState()
    private var cancellables: Set<AnyCancellable> = []

    init(
        surahRepository: SurahRepository,
        surahVerseRepository: SurahVerseRepository,
        surahVersePreferencesRepository: SurahVersePreferencesRepository
    ) {
        self.surahRepository = surahRepository
        self.surahVerseRepository = surahVerseRepository
        self.surahVersePreferencesRepository = surahVersePreferencesRepository
        
        initUiState()
    }
    
    func onQuranContentTypeChange(_ contentType: QuranContentType) {
        uiState.contentType = contentType
    }
    
    private func initUiState() {
        let surahsPublisher = surahRepository.getSurahs()
        let allJuzPublisher = surahVerseRepository.getAllJuz()
        let allHizbPublisher = surahVerseRepository.getAllHizb()
        let preferencesPublisher = surahVersePreferencesRepository.getSurahVersePreferencesPublisher()
        
        Publishers.CombineLatest4(
            surahsPublisher,
            allJuzPublisher,
            allHizbPublisher,
            preferencesPublisher
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] surahs, allJuz, allHizb, preferences in
            self?.uiState.surahs = surahs
            self?.uiState.allJuz = allJuz
            self?.uiState.allHizb = allHizb
            self?.uiState.preferences = preferences
            self?.uiState.isLoading = false
        }.store(in: &cancellables)
    }
    
    struct QuranUiState: Copying {
        fileprivate(set) var surahs: [Surah] = []
        fileprivate(set) var allJuz: [Juz] = []
        fileprivate(set) var allHizb: [Hizb] = []
        fileprivate(set) var preferences: SurahVersePreferences? = nil
        fileprivate(set) var contentType: QuranContentType = .surah
        fileprivate(set) var isLoading: Bool = true
    }
    
    enum QuranContentType: CaseIterable {
        case surah
        case juz
        case hizb
    }
}
