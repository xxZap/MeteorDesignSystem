//
//  MSection.swift
//  
//
//  Created by Alessio Boerio on 06/06/24.
//

import SwiftUI

public struct MSection<Header: View, Footer: View, Content: View>: View {

    let content: () -> Content
    let header: () -> Header?
    let footer: () -> Footer?

    public init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder header: @escaping () -> Header? = { EmptyView() },
        @ViewBuilder footer: @escaping () -> Footer? = { EmptyView() }
    ) {
        self.content = content
        self.header = header
        self.footer = footer
    }

    public var body: some View {
        Section {
            content()
        } header: {
            header()
                .foregroundStyle(Color.mMediumText)
        } footer: {
            footer()
                .foregroundStyle(Color.mMediumText)
        }
    }
}

#if DEBUG
#Preview {
    MPreviewContainer {
        MList {
            MSection {
                MListItem(text: "Footer and Header") { }
            } header: {
                Text("header")
            } footer: {
                Text("footer")
            }

            MSection {
                MListItem(text: "Header") { }
            } header: {
                Text("header")
            }

            MSection {
                MListItem(text: "Footer") { }
            } footer: {
                Text("footer")
            }
        }
    }
}
#endif
