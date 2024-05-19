//
//  MPreviewContainer.swift
//  
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

struct MPreviewContainer<Content: View>: View {

    let backgroundColor: Color
    let content: Content

    init(
        backgroundColor: Color = Color.mBackground,
        @ViewBuilder content: () -> Content
    ) {
        self.backgroundColor = backgroundColor
        self.content = content()
    }

    var body: some View {
        VStack {
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
}
