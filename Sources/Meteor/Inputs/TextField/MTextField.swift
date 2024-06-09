//
//  MTextField.swift
//
//
//  Created by Alessio Boerio on 22/04/24.
//

import SwiftUI

public struct MTextField: View {

    @Binding public var text: String
    public var placeholder: String
    public var title: String
    public var onTooltipTap: (() -> Void)?
    private var mandatoryString: String

    public init(
        text: Binding<String>,
        placeholder: String,
        title: String,
        isMandatory: Bool = false,
        onTooltipTap: (() -> Void)? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.title = title
        self.mandatoryString = isMandatory ? "*" : ""
        self.onTooltipTap = onTooltipTap
    }

    public var body: some View {
        VStack(spacing: 4) {
            if !title.isEmpty {
                HStack(alignment: .bottom, spacing: 16) {
                    Group {
                        Text(title)
                            .foregroundStyle(Color.mLightText)
                        +
                        Text(mandatoryString)
                            .foregroundStyle(Color.mAccent)
                    }
                    .font(.callout)
                    .frame(maxWidth: .infinity, minHeight: 24, alignment: .leading)

                    if let interaction = onTooltipTap {
                        Button {
                            interaction()
                        } label: {
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .tint(Color.mAccent)
                    }
                }
                .padding(.horizontal, 16)
            }
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(Color.mMediumText)
                }
                .padding(16)
                .foregroundStyle(Color.mLightText)
                .background(Color.mBackgroundDark)
                .clipShape(.capsule)
                .tint(Color.mAccent)
        }
    }
}

private extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }

    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(text: text))
    }
}

private struct TextFieldClearButton: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        content
            .overlay {
                if !text.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            text = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                        }
                        .foregroundColor(.secondary)
                        .padding(.trailing, 4)
                    }
                }
            }
    }
}

#if DEBUG
#Preview("\(MTextField.self)") {
    struct BindingContainer : View {
        @State private var text: String = ""
        var body: some View {
            MTextField(
                text: $text,
                placeholder: "placeholder",
                title: "Title",
                isMandatory: true,
                onTooltipTap: { }
            )
        }
    }

    return MPreviewContainer {
        BindingContainer()
            .padding()
    }
}
#endif
