//
//  MMenuPicker.swift
//
//
//  Created by Alessio Boerio on 07/06/24.
//

import SwiftUI

public struct MMenuPickerElement: Hashable {
    public var title: String
    public var image: Image?

    public init(title: String, image: Image? = nil) {
        self.title = title
        self.image = image
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

public struct MMenuPicker: View {

    let title: String
    let mandatoryString: String
    let elements: [MMenuPickerElement?]
    @Binding var selectedElement: MMenuPickerElement?
    var onTooltipTap: (() -> Void)?

    public init(
        selectedElement: Binding<MMenuPickerElement?>,
        elements: [MMenuPickerElement?],
        title: String,
        isMandatory: Bool = false,
        onTooltipTap: (() -> Void)? = nil
    ) {
        self._selectedElement = selectedElement
        self.elements = elements
        self.title = title
        self.mandatoryString = isMandatory ? "*" : ""
        self.onTooltipTap = onTooltipTap
    }

    public var body: some View {
        VStack(spacing: 4) {
            if !title.isEmpty {
                HStack(alignment: .center, spacing: 16) {
                    Group {
                        Text(title)
                            .foregroundStyle(Color.mLightText)
                        +
                        Text(mandatoryString)
                            .foregroundStyle(Color.mAccent)
                    }
                    .font(.callout)
                    .fixedSize()
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
            Picker(title, selection: $selectedElement) {
                ForEach(elements, id: \.self) { element in
                    if let element {
                        HStack(spacing: 8) {
                            Text(element.title)
                                .frame(maxWidth: .infinity)
                                .contentShape(Rectangle())
                                .border(.green)
                            element.image
                        }
                        .tag(element.title)
                    } else {
                        Text("-")
                            .frame(maxWidth: .infinity)
                            .contentShape(Rectangle())
                            .tag("-")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .contentShape(Rectangle())
            .pickerStyle(.menu)
            .padding(16)
            .background(Color.mBackgroundDark)
            .clipShape(.capsule)
            .tint(selectedElement == nil ? Color.mMediumText : Color.mLightText)
        }
    }
}

#if DEBUG
#Preview("\(MTextField.self)") {
    struct BindingContainer : View {
        @State private var selectedElement: MMenuPickerElement? = nil
        @State private var elements: [MMenuPickerElement?] = [
            MMenuPickerElement(title: "Up", image: Image(systemName: "chevron.up")),
            MMenuPickerElement(title: "Right", image: Image(systemName: "chevron.right")),
            MMenuPickerElement(title: "Down", image: Image(systemName: "chevron.down")),
            MMenuPickerElement(title: "Left", image: Image(systemName: "chevron.left")),
            nil
        ]
        var body: some View {
            MMenuPicker(
                selectedElement: $selectedElement,
                elements: elements,
                title: "Title",
                isMandatory: true
            ) {
                
            }
        }
    }

    return MPreviewContainer {
        BindingContainer()
            .padding()
    }
}
#endif
