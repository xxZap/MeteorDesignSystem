//
//  MButton.swift
//  FeedYourPassions
//
//  Created by Alessio Boerio on 19/05/24.
//

import SwiftUI

public struct MButton: View {

    var type: MButtonType
    var size: MButtonSize
    var customWidth: CGFloat?

    var title: String
    var image: Image?
    var onTap: (() -> Void)
    var isLoading: Bool

    public init(
        type: MButtonType,
        size: MButtonSize,
        title: String,
        image: Image?,
        loading: Bool,
        customWidth: CGFloat? = nil,
        onTap: @escaping (() -> Void) = {}
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
                                .font(.body)
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
    @State var type: MButtonType = .primary
    var body: some View {
        ScrollView {
            VStack {
                Text(type.toString())
                    .font(.title2)
                    .padding(8)
                    .background(Color.white.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.bottom, 50)
                MButton(
                    type: type,
                    size: .small,
                    title: "Image - small",
                    image: Image(systemName: "square.and.arrow.up"),
                    loading: false
                ) { nextType() }
                MButton(
                    type: type,
                    size: .small,
                    title: "Image - small",
                    image: Image(systemName: "square.and.arrow.up"),
                    loading: true
                ) { nextType() }
                MButton(
                    type: type,
                    size: .regular,
                    title: "Image - regular",
                    image: Image(systemName: "square.and.arrow.up"),
                    loading: false
                ) { nextType() }
                MButton(
                    type: type,
                    size: .regular,
                    title: "Image - regular",
                    image: Image(systemName: "square.and.arrow.up"),
                    loading: true
                ) { nextType() }
                MButton(
                    type: type,
                    size: .regular,
                    title: "Full width",
                    image: nil,
                    loading: false,
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
}

#Preview {
    MPreviewContainer {
        Spacer()

        MButtonPreview()

        Spacer()
    }
}
#endif
