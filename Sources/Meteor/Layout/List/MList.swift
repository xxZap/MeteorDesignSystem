//
//  MList.swift
//
//
//  Created by Alessio Boerio on 06/06/24.
//

import SwiftUI

public struct MList<Content: View>: View {

    let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        List {
            content()
        }
        .scrollContentBackground(.hidden)
    }
}

#if DEBUG
#Preview {
    MPreviewContainer {
        MList {
            MSection {
                MListItem(text: "Some text") { }
                MListItem(text: "Some text") { }
                MListItem(text: "Some text") { }
            } header: {
                Text("header")
            } footer: {
                Text("footer")
            }

            MSection {
                MListItem(text: "Some text") { }
            }
        }
    }
}
#endif
