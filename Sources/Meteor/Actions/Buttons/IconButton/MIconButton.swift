//
//  MIconButton.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

/// This **View** represents a Button that, according to given options, can represent
/// an icon and executes an action when touched.
public struct MIconButton: View {
    
    /// The type of the button.
    var type: MIconButtonType
    /// The size of the button.
    var size: MIconButtonSize
    /// The icon this button should show.
    var image: Image
    /// The action to call when the button is touched.
    var onTap: (() -> Void)
    /// If `true`, a loader that covers the button content is shown.
    /// While in loading, the button is not interactable.
    var isLoading: Bool
    
    /// An **MIconButton** is a **Button** that can show an image.
    /// - Parameters:
    ///   - type: the type the button should be.
    ///   - size: the size the button should have.
    ///   - image: the image the button should show.
    ///   - loading: the loading state of the button. Default is `false`.
    ///   If true, a loader inside the button is shown. While in loading state, the button is not interactable
    ///   - onTap: the action to call when the button is touched
    public init(
        type: MIconButtonType,
        size: MIconButtonSize,
        image: Image,
        loading: Bool = false,
        onTap: @escaping (() -> Void)
    ) {
        self.type = type
        self.size = size
        self.image = image
        self.isLoading = loading
        self.onTap = onTap
    }

    public var body: some View {
        Button(
            action: { onTap() },
            label: {
                ZStack(alignment: .center) {
                    MSpinner(size: size.controlSize, color: type.progressColor)
                        .opacity(isLoading ? 1 : 0)

                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(type.iconColor)
                        .frame(width: size.iconSize, height: size.iconSize)
                        .opacity(isLoading ? 0 : 1)
                }
                .padding(size.padding)
            }
        )
        .shadow(color: type.shadowColor, radius: type.shadowRadius)
        .buttonStyle(MIconButtonPressable(type: type))
        .disabled(isLoading)
    }
}

#if DEBUG
#Preview {
    MPreviewContainer {
        Spacer()

        MIconButton(type: .primary,         size: .small,   image: Image(systemName: "heart"),    loading: false) { }
        MIconButton(type: .primary,         size: .regular, image: Image(systemName: "heart"),    loading: false) { }
        MIconButton(type: .primary,         size: .small,   image: Image(systemName: "heart"),    loading: true) { }
        MIconButton(type: .primary,         size: .regular, image: Image(systemName: "heart"),    loading: true) { }
        MIconButton(type: .secondary,       size: .small,   image: Image(systemName: "heart"),    loading: false) { }
        MIconButton(type: .secondary,       size: .regular, image: Image(systemName: "heart"),    loading: false) { }
        MIconButton(type: .secondary,       size: .small,   image: Image(systemName: "heart"),    loading: true) { }
        MIconButton(type: .secondary,       size: .regular, image: Image(systemName: "heart"),    loading: true) { }
        MIconButton(type: .primaryGhost,    size: .small,   image: Image(systemName: "heart"),    loading: false) { }
        MIconButton(type: .primaryGhost,    size: .regular, image: Image(systemName: "heart"),    loading: false) { }
        MIconButton(type: .primaryGhost,    size: .small,   image: Image(systemName: "heart"),    loading: true) { }
        MIconButton(type: .primaryGhost,    size: .regular, image: Image(systemName: "heart"),    loading: true) { }
        MIconButton(type: .secondaryGhost,  size: .small,   image: Image(systemName: "heart"),    loading: false) { }
        MIconButton(type: .secondaryGhost,  size: .regular, image: Image(systemName: "heart"),    loading: false) { }
        MIconButton(type: .secondaryGhost,  size: .small,   image: Image(systemName: "heart"),    loading: true) { }
        MIconButton(type: .secondaryGhost,  size: .regular, image: Image(systemName: "heart"),    loading: true) { }

        Spacer()
    }
}
#endif
