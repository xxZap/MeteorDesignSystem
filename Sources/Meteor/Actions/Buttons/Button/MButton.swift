//
//  MButton.swift
//  FeedYourPassions
//
//  Created by Alessio Boerio on 19/05/24.
//

import SwiftUI

/// This **View** represents a Button that, according to given options, can represent
/// text, icon or both, and executes an action when touched.
public struct MButton: View {
    
    /// The type of the button.
    var type: MButtonType
    /// The size of the button.
    var size: MButtonSize
    /// If not `nil`, it forces the view to have this width.
    /// Useful if you need full-width buttons by passing `.infinity`.
    var customWidth: CGFloat?
    /// The textual content inside the button.
    var title: String
    /// The leading image content inside the button.
    var image: Image?
    /// The action to call when the button is touched.
    var onTap: (() -> Void)
    /// If `true`, a loader that covers the button content is shown.
    /// /// While in loading, the button is not interactable.
    var isLoading: Bool
    
    /// An **MButton** is a **Button** that can show any combination of text and image.
    /// - Parameters:
    ///   - type: the type the button should be.
    ///   - size: the size the button should have.
    ///   - title: the textual content the button should show. If `empty`, it will shows no textual content
    ///   - image: the leading image the button should have. Default is `nil`.
    ///   - loading: the loading state of the button. Default is `false`.
    ///   If true, a loader inside the button is shown. While in loading state, the button is not interactable.
    ///   - customWidth: the custom width the button should have. Default is `nil` and the button simply wraps the content.
    ///   - onTap: the action to call when the button is touched.
    public init(
        type: MButtonType,
        size: MButtonSize,
        title: String,
        image: Image? = nil,
        loading: Bool = false,
        customWidth: CGFloat? = nil,
        onTap: @escaping (() -> Void)
    ) {
        self.type = type
        self.size = size
        self.title = title
        self.image = image
        self.isLoading = loading
        self.onTap = onTap
        self.customWidth = customWidth
    }

    public var body: some View {
        Button(
            action: { onTap() },
            label: {
                ZStack {
                    MSpinner(size: .regular, color: type.progressColor)
                        .opacity(isLoading ? 1 : 0)

                    HStack(spacing: 4) {
                        if let image = image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(type.textColor)
                                .frame(width: 16, height: 16)
                                .opacity(isLoading ? 0 : 1)
                        }

                        if !title.isEmpty {
                            Text(title)
                                .font(.body.weight(.medium))
                                .foregroundStyle(type.textColor)
                                .opacity(isLoading ? 0 : 1)
                        }
                    }
                    .frame(maxWidth: customWidth)
                    .padding(.horizontal, size.horizontalPadding)
                    .padding(.vertical, size.verticalPadding)
                }
                .frame(minHeight: size.minHeight)
            }
        )
        .buttonStyle(MButtonPressable(type: type))
        .disabled(isLoading)
    }
}

#if DEBUG
private struct MButtonPreview: View {
    @State var type: MButton.MButtonType = .primary
    @State var size: MButton.MButtonSize = .small
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button {
                        nextType()
                    } label: {
                        Text("type: \(type.toString())")
                            .font(.title2)
                            .foregroundStyle(Color.mLightText)
                            .frame(alignment: .leading)
                            .padding(8)
                    }
                    .buttonStyle(MButtonPressable(type: .secondary))
                    Spacer()
                    Button {
                        nextSize()
                    } label: {
                        Text("size: \(size.toString())")
                            .font(.title2)
                            .foregroundStyle(Color.mLightText)
                            .frame(alignment: .trailing)
                            .padding(8)
                    }
                    .buttonStyle(MButtonPressable(type: .secondary))
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)

                MButton(
                    type: type,
                    size: size,
                    title: "",
                    image: Image(systemName: "square.and.arrow.up")
                ) { nextType() }
                MButton(
                    type: type,
                    size: size,
                    title: "",
                    image: Image(systemName: "square.and.arrow.up"),
                    loading: true
                ) { nextType() }
                MButton(
                    type: type,
                    size: size,
                    title: "Text"
                ) { nextType() }
                MButton(
                    type: type,
                    size: size,
                    title: "Text",
                    loading: true
                ) { nextType() }
                MButton(
                    type: type,
                    size: size,
                    title: "Image + Text",
                    image: Image(systemName: "square.and.arrow.up")
                ) { nextType() }
                MButton(
                    type: type,
                    size: size,
                    title: "Image + Text",
                    image: Image(systemName: "square.and.arrow.up"),
                    loading: true
                ) { nextType() }
                MButton(
                    type: type,
                    size: size,
                    title: "Full width",
                    customWidth: .infinity
                ) { nextType() }
            }
        }
    }

    func nextType() {
        self.type = switch type {
        case .primary:
                .secondary
        case .secondary:
                .text
        case .text:
                .danger
        case .danger:
                .primary
        }
    }

    func nextSize() {
        self.size = switch size {
        case .small:
                .regular
        case .regular:
                .small
        }
    }
}

#Preview {
    MPreviewContainer {
        Spacer()

        MButtonPreview()

        Spacer()
    }
}
#endif
