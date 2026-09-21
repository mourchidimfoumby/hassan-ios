//
//  ArrayExtension.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 19/09/2026.
//

extension Array {
    func getOrNull(_ index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
