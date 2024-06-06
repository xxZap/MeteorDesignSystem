//
//  MListItem.swift
//
//
//  Created by Alessio Boerio on 05/06/24.
//

import SwiftUI

public struct MListItem: View {
    var text: String
    var icon: Image?
    var iconColor: Color
    var action: (() -> Void)

    public init(
        text: String,
        icon: Image? = nil,
        iconColor: Color = Color.mLightText,
        action: @escaping (() -> Void)
    ) {
        self.text = text
        self.icon = icon
        self.iconColor = iconColor
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            HStack(alignment: .center, spacing: 8) {
                Text(text)
                    .font(.body)
                    .foregroundStyle(Color.mLightText)
                    .frame(maxWidth: .infinity, minHeight: 32, alignment: .leading)
                    .multilineTextAlignment(.leading)

                if let icon {
                    icon
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 32, alignment: .center)
                        .foregroundStyle(iconColor)
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .listRowBackground(Color.mBackgroundLight)
        .listRowSeparatorTint(Color.mLightText)
    }
}

#if DEBUG
#Preview {
    MPreviewContainer {
        List {
            Section {
                MListItem(
                    text: "Some text",
                    icon: Image(systemName: "chevron.right")
                ) { }
                MListItem(
                    text: "Some\nvery long text\non multiple lines",
                    icon: Image(systemName: "chevron.right")
                ) { }
            }

            Section {
                MListItem(
                    text: "Some text",
                    icon: Image(systemName: "rectangle.portrait.and.arrow.right"),
                    iconColor: Color.mDangerText
                ) { }
            }
        }
        .scrollContentBackground(.hidden)
    }
}
#endif
