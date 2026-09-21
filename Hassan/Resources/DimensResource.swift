//
//  DimensResource.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Foundation

enum DimensResource {
    case extraSmallPadding
    case smallPadding
    case smallMediumPadding
    case mediumPadding
    case mediumLargePadding
    case largePadding
    case extraLargePadding
    case veryExtraLargePadding
    case defaultIconSize

    var value: CGFloat {
        switch self {
            case .extraSmallPadding: 4
            case .smallPadding: 8
            case .smallMediumPadding: 12
            case .mediumPadding: 16
            case .mediumLargePadding: 20
            case .largePadding: 24
            case .extraLargePadding: 32
            case .veryExtraLargePadding: 64
            case .defaultIconSize: 24
        }
    }
}

