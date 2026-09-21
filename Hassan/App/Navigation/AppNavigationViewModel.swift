//
//  AppNavigationViewModel.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

import Combine
import Foundation

class AppNavigationViewModel: ViewModel {
    @Published private(set) var uiState = AppNavigationUiState()
    @Published var selectedTab: TopLevelDestination = .quran
    
    struct AppNavigationUiState {
        fileprivate(set) var topLevelDestinations: [TopLevelDestination] = [.quran]
    }
}
