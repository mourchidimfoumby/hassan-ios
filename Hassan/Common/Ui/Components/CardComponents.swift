//
//  CardComponents.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 13/09/2026.
//

import SwiftUI

struct Card<Content: View>: View {
    let onClick: (() -> Void)?
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.onClick = nil
    }
    
    private func card(_ content: () -> Content) -> some View {
        HStack(content: content)
            .background(.surfaceContainerHigh)
            .clipShape(Shapes.cornerMedium)
    }
    
    var body: some View {
        if let onClick {
            Button(action: onClick) {
                card(content)
            }
        } else {
            card(content)
        }
    }
}

extension Card {
    init(
        onClick: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.onClick = onClick
        
    }
}

#Preview {
    Card {
        Text("Card")
    }
}
