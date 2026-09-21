//
//  ColorExtension.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 13/09/2026.
//

import SwiftUI

extension Color {
    init(r: Int, g: Int, b: Int) {
        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255
        )
    }
}
