//
//  MSideButton.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

public struct MSideButton: View {

    public enum Side: Equatable {
        case attachedToTheLeft, attachedToTheRight
    }

    public var onTap: (() -> Void)
    public var image: Image
    public var side: Side

    public init(onTap: @escaping () -> Void, image: Image, side: Side) {
        self.onTap = onTap
        self.image = image
        self.side = side
    }

    public var body: some View {
        Group {
            MIconButton(type: .secondary, size: .small, image: image) {
                onTap()
            }
            .padding(16)
        }
        .background(Color.mAccent)
        .clipShape(
            .rect(
                topLeadingRadius: side == .attachedToTheLeft ? 0 : 16,
                bottomLeadingRadius: side == .attachedToTheLeft ? 0 : 16,
                bottomTrailingRadius: side == .attachedToTheLeft ? 16 : 0,
                topTrailingRadius: side == .attachedToTheLeft ? 16 : 0
            )
        )
    }
}

#if DEBUG
#Preview("\(MSideButton.self)") {
    MPreviewContainer {
        Spacer()
        HStack {
            MSideButton(onTap: { }, image: Image(systemName: "plus"), side: .attachedToTheLeft)
            Spacer()
        }
        Spacer()
        HStack {
            Spacer()
            MSideButton(onTap: { }, image: Image(systemName: "plus"), side: .attachedToTheRight)
        }
        Spacer()
    }
}
#endif
