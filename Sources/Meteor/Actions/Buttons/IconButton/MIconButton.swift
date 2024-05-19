//
//  MIconButton.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

public struct MIconButton: View {

    var type: MIconButtonType
    var size: MIconButtonSize
    var loading: Bool

    var image: Image
    var onTap: (() -> Void)

    public init(
        type: MIconButtonType,
        size: MIconButtonSize,
        image: Image,
        loading: Bool = false,
        onTap: @escaping (() -> Void) = {}
    ) {
        self.type = type
        self.size = size
        self.image = image
        self.loading = loading
        self.onTap = onTap
    }

    public var body: some View {
        Button(
            action: { onTap() },
            label: {
                ZStack(alignment: .center) {
                    MSpinner(size: size.controlSize, color: type.progressColor)
                        .opacity(loading ? 1 : 0)

                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundStyle(type.iconColor)
                        .opacity(loading ? 0 : 1)
                }
                .padding(size.padding)
            }
        )
        .shadow(color: type.shadowColor, radius: type.shadowRadius)
        .buttonStyle(MIconButtonPressable(type: type))
        .disabled(loading)
    }
}

#if DEBUG
#Preview {
    MPreviewContainer {
        Spacer()

        MIconButton(type: .primary,     size: .small,       image: Image(systemName: "square.and.arrow.up"),     loading: false)
        MIconButton(type: .primary,     size: .regular,     image: Image(systemName: "square.and.arrow.up"),     loading: false)
        MIconButton(type: .primary,     size: .small,       image: Image(systemName: "square.and.arrow.up"),     loading: true)
        MIconButton(type: .primary,     size: .regular,     image: Image(systemName: "square.and.arrow.up"),     loading: true)
        MIconButton(type: .secondary,   size: .small,       image: Image(systemName: "square.and.arrow.up"),     loading: false)
        MIconButton(type: .secondary,   size: .regular,     image: Image(systemName: "square.and.arrow.up"),     loading: false)
        MIconButton(type: .secondary,   size: .small,       image: Image(systemName: "square.and.arrow.up"),     loading: true)
        MIconButton(type: .secondary,   size: .regular,     image: Image(systemName: "square.and.arrow.up"),     loading: true)
        MIconButton(type: .ghost,       size: .small,       image: Image(systemName: "square.and.arrow.up"),     loading: false)
        MIconButton(type: .ghost,       size: .regular,     image: Image(systemName: "square.and.arrow.up"),     loading: false)
        MIconButton(type: .ghost,       size: .small,       image: Image(systemName: "square.and.arrow.up"),     loading: true)
        MIconButton(type: .ghost,       size: .regular,     image: Image(systemName: "square.and.arrow.up"),     loading: true)

        Spacer()
    }
}
#endif
