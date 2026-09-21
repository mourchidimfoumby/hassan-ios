//
//  TextComponents.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import SwiftUI

struct SectionTitle: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.headline)
    }
}

#Preview {
    SectionTitle("Section title")
}
