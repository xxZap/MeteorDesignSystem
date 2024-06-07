//
//  MDivider.swift
//  
//
//  Created by Alessio Boerio on 07/06/24.
//

import SwiftUI

public enum MDividerType {
    case line(maxWidth: CGFloat)
    case point
    case string(_ string: String)
}

public struct MDivider: View {

    public let type: MDividerType

    public init(type: MDividerType) {
        self.type = type
    }

    public var body: some View {
        HStack(spacing: 16) {
            switch type {
            case .line(let maxWidth):
                line(maxWidth)

            case .point:
                line()
                Circle()
                    .fill(Color.mLightText)
                    .frame(width: 4, height: 4)
                line()

            case .string(let string):
                line()
                Text(string)
                    .font(.footnote)
                    .foregroundStyle(Color.mLightText)
                line()
            }
        }
    }

    private func line(_ maxWidth: CGFloat = 60) -> some View {
        Rectangle()
            .fill(Color.mBorder)
            .frame(height: 2)
            .frame(maxWidth: maxWidth)
            .clipShape(Capsule())
    }
}

#if DEBUG
#Preview {
    MPreviewContainer {
        MDivider(type: .point)
        MDivider(type: .string("OR"))
        MDivider(type: .line(maxWidth: 360))
        MDivider(type: .line(maxWidth: .infinity))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
}
#endif
