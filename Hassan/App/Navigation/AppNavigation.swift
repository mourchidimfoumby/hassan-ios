//
//  AppNavigation.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

import Combine
import SwiftUI
import Foundation

struct AppNavigation: View {
    @StateObject private var viewModel = AppMainThreadInjector.shared.resolve(AppNavigationViewModel.self)
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            ForEach(viewModel.uiState.topLevelDestinations) { tab in
                TabContent(
                    tab: tab,
                    selected: tab == viewModel.selectedTab
                )
            }
        }
    }
}

private struct TabContent: View {
    private let tab: TopLevelDestination
    private let icon: String
    
    init(
        tab: TopLevelDestination,
        selected: Bool
    ) {
        self.tab = tab
        self.icon = selected ? tab.filledIcon : tab.outlinedIcon
    }
    
    var body: some View {
        Group {
            switch tab {
                case .quran: QuranNavigation()
            }
        }
        .tabItem {
            Label(tab.label, systemImage: icon)
                .environment(\.symbolVariants, .none)
        }
        .tag(tab)
    }
}
