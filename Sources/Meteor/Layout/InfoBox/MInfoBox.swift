//
//  MInfoBox.swift
//
//
//  Created by Alessio Boerio on 16/05/24.
//

import SwiftUI

public struct MInfoBox: View {

    var image: Image
    var text: String
    var color: Color

    public init(
        image: Image = Image(systemName: "exclamationmark.bubble"),
        text: String,
        color: Color = Color.mBackgroundDark
    ) {
        self.image = image
        self.text = text
        self.color = color
    }

    public var body: some View {
        HStack(spacing: 0) {
            image
                .foregroundStyle(Color.mAccent)
                .padding(.leading, 16)
                .padding(.vertical, 8)
            Text(text)
                .foregroundStyle(Color.mLightText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
        }
        .background(Color.mBackgroundDark)
        .clipShape(.rect(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.mAccentDark, lineWidth: 1))
    }
}

#if DEBUG
#Preview {
    MInfoBox(
        image: Image(systemName: "exclamationmark.bubble"),
        text: "Example message",
        color: Color.mBackgroundDark
    )
}
#endif
