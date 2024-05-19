//
//  MTooltip.swift
//
//
//  Created by Alessio Boerio on 16/05/24.
//

import SwiftUI

public struct TooltipViewModel: Equatable {

    public var text: String
    public var buttonText: String

    public init(text: String, buttonText: String) {
        self.text = text
        self.buttonText = buttonText
    }
}

public struct MTooltip: View {
    @Binding var isPresented: TooltipViewModel?

    public init(isPresented: Binding<TooltipViewModel?>) {
        self._isPresented = isPresented
    }

    public var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.3))
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = nil
                }

            if let viewModel = isPresented {
                VStack(spacing: 24) {
                    Text(viewModel.text)
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)

                    Button {
                        isPresented = nil
                    } label: {
                        Text(viewModel.buttonText)
                            .foregroundStyle(Color.mDarkText)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.mAccent)
                }
                .frame(width: 200, alignment: .center)
                .padding(32)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .background(.clear)
    }
}

#if DEBUG
#Preview {
    MTooltip(
        isPresented: .constant(
            .init(
                text: "Some text that can cover multiple lines",
                buttonText: "Ok"
            )
        )
    )
}
#endif
