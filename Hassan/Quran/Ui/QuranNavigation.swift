//
//  QuranNavigation.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import SwiftUI

struct QuranNavigation: View {
    @StateObject private var viewModel = QuranMainThreadInjector.shared.resolve(QuranNavigationViewModel.self)

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            QuranDestination(
                onSurahClick: {_ in 
                    
                },
                onJuzClick: {_,_ in 
                    
                },
                onHizbClick: {_,_ in 
                    
                },
                onSurahBookmarkClick: {_,_ in 
                    
                },
                onJuzBookmarkClick: {_,_,_ in 
                    
                },
                onHizbBookmarkClick: {_,_,_ in 
                    
                },
                onSearchClick: {
                    
                }
            )
            .toolbar(viewModel.path.isEmpty ? .visible : .hidden, for: .tabBar)
        }
    }
}
