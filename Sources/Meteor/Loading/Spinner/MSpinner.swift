//
//  MSpinner.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

public struct MSpinner: View {

    private var size: MSpinnerSize
    private var color: MSpinnerColor

    public init(
        size: MSpinnerSize,
        color: MSpinnerColor
    ) {
        self.size = size
        self.color = color
    }

    public var body: some View {
        ProgressView()
            .controlSize(size.controlSize)
            .tint(color.color)
    }
}

// MARK: - Preview

#Preview("StarkSpinner") {
    MPreviewContainer {
        HStack(alignment: .center, spacing: 16) {

            VStack(spacing: 16) {
                MSpinner(size: .large, color: .accent)
                MSpinner(size: .regular, color: .accent)
                MSpinner(size: .small, color: .accent)
            }

            VStack(spacing: 16) {
                MSpinner(size: .large, color: .dark)
                MSpinner(size: .regular, color: .dark)
                MSpinner(size: .small, color: .dark)
            }
            .padding()
            .background(Color.mWhite)
            .clipShape(.rect(cornerRadius: 8))

            VStack(spacing: 16) {
                MSpinner(size: .large, color: .white)
                MSpinner(size: .regular, color: .white)
                MSpinner(size: .small, color: .white)
            }
        }
        .padding()
    }
}
