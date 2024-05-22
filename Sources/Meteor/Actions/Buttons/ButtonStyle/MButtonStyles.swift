//
//  FYPButtonStyles.swift
//  FeedYourPassions
//
//  Created by Alessio Boerio on 20/04/24.
//

import SwiftUI

public struct MPressable: ButtonStyle {

    public var pressedColor: Color

    public init(pressedColor: Color = Color.mBackgroundDark.opacity(0.4)) {
        self.pressedColor = pressedColor
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .edgesIgnoringSafeArea(.all)
            .background(configuration.isPressed ? pressedColor : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .animation(.smooth(duration: MAnimationDuration.veryFast.rawValue), value: configuration.isPressed)
    }
}

public struct MButtonPressable: ButtonStyle {

    public var type: MButton.MButtonType

    public init(type: MButton.MButtonType) {
        self.type = type
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .ignoresSafeArea(.all)
            .background(configuration.isPressed ? type.pressedColor : type.backgroundColor)
            .clipShape(.rect(cornerRadius: 8))
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(type.borderColor, lineWidth: 1)
            )
    }
}

public struct MIconButtonPressable: ButtonStyle {

    public var type: MIconButton.MIconButtonType

    public init(type: MIconButton.MIconButtonType) {
        self.type = type
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .ignoresSafeArea(.all)
            .background(configuration.isPressed ? type.pressedColor : type.backgroundColor)
            .clipShape(.circle)
            .contentShape(Circle())
            .overlay(
                Circle()
                    .stroke(type.borderColor, lineWidth: 2)
            )
    }
}
