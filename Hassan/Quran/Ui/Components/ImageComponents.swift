//
//  ImageComponent.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 13/09/2026.
//

import SwiftUI

struct SurahNameImage: View {
    let surahNumber: Int
    
    var body: some View {
        Image(SurahMetadata.getSurahImage(surahNumber: surahNumber))
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .frame(height: 32)
            .foregroundStyle(.onSurfaceVariant)
    }
}

#Preview {
    SurahNameImage(surahNumber: 1)
}
