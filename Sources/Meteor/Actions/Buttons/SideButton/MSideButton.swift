//
//  MSideButton.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

/// This **View** represents a Button that stays sticky to the lateral edges of the screen.
public struct MSideButton: View {
    
    /// The side of the container this view should stay attached.
    public enum Side: Equatable {
        case attachedToTheLeft, attachedToTheRight
    }
    
    /// The image this button should show.
    public var image: Image
    /// The side this view should stay attached to.
    public var side: Side
    /// The action to call when the button is touched.
    public var onTap: (() -> Void)
    
    /// An **MSideButton** is a **Button** that can show an image and stay attached to an edge of the screen.
    /// - Parameters:
    ///   - image: the image this button should show.
    ///   - side: the side this button should stay attached to.
    ///   - onTap: the action to call when the button is touched.
    public init(
        image: Image,
        side: Side,
        onTap: @escaping () -> Void
    ) {
        self.image = image
        self.side = side
        self.onTap = onTap
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
            MSideButton(image: Image(systemName: "plus"), side: .attachedToTheLeft) { }
            Spacer()
        }
        Spacer()
        HStack {
            Spacer()
            MSideButton(image: Image(systemName: "plus"), side: .attachedToTheRight) { }
        }
        Spacer()
    }
}
#endif
