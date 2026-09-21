//
//  TopLevelDestination.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

enum TopLevelDestination: Hashable, Identifiable {
    case quran
    
    var id: Int {
        self.hashValue
    }
    
    var label: String {
        switch self {
            case .quran: stringResource(.quran)
        }
    }
    
    var filledIcon: String {
        switch self {
            case .quran: "book.closed.fill"
        }
    }
    
    var outlinedIcon: String {
        switch self {
            case .quran: "book.closed"
        }
    }
}
