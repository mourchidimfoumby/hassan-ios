//
//  QuranNavigationViewModel.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Foundation
import Combine

class QuranNavigationViewModel: ViewModel {
    @Published var path: [QuranMainRoute] = []
}

enum QuranMainRoute: MainRoute {
    case quran
}
