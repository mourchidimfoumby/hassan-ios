//
//  ListComponents.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import SwiftUI

struct PlainListItem<
    LeadingContent: View,
    HeadlineContent: View,
    SupportingContent: View,
    TrailingContent: View
>: View {
    let leadingContent: LeadingContent
    let headlineContent: HeadlineContent
    let trailingContent: TrailingContent
    let supportingContent: SupportingContent
    
    init(
        headlineContent: () -> HeadlineContent,
        leadingContent: () -> LeadingContent = { EmptyView() },
        trailingContent: () -> TrailingContent = { EmptyView() },
        supportingContent: () -> SupportingContent = { EmptyView() }
    ) {
        self.headlineContent = headlineContent()
        self.leadingContent = leadingContent()
        self.trailingContent = trailingContent()
        self.supportingContent = supportingContent()
    }
    
    var body: some View {
        HStack(spacing: dimensionResource(.smallPadding)) {
            leadingContent
                .padding(.trailing, dimensionResource(.mediumPadding))
            
            HStack(spacing: dimensionResource(.mediumPadding)) {
                VStack(alignment: .leading, spacing: dimensionResource(.smallPadding)) {
                    headlineContent
                    supportingContent
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                trailingContent
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

#Preview {
    PlainListItem(
        headlineContent: { Text("Plain list item") },
        leadingContent: { Image(systemName: "star") }
    )
}
