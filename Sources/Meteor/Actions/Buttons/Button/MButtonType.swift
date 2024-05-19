//
//  MButtonType.swift
//  FeedYourPassions
//
//  Created by Alessio Boerio on 19/05/24.
//

import SwiftUI

public enum MButtonType {
    case text
    case primary
    case secondary
    case danger

    func toString() -> String {
        switch self {
        case .text:
            "text"
        case .primary:
            "primary"
        case .secondary:
            "secondary"
        case .danger:
            "danger"
        }
    }

    var textColor: Color {
        switch self {
        case .text:
            return .mAccent
        case .primary:
            return .mDarkText
        case .secondary:
            return .mLightText
        case .danger:
            return .mLightText
        }
    }

    var backgroundColor: Color {
        switch self {
        case .text:
            return .white.opacity(0)
        case .primary:
            return .mAccent
        case .secondary:
            return .white.opacity(0)
        case .danger:
            return .mDanger
        }
    }

    var pressedColor: Color {
        switch self {
        case .text:
            return .mAccentDark.opacity(0.3)
        case .primary:
            return .mAccentDark
        case .secondary:
            return .mBackgroundDark
        case .danger:
            return .mDangerDark
        }
    }

    var borderColor: Color {
        switch self {
        case .text:
            return .clear
        case .primary:
            return .clear
        case .secondary:
            return .mBorder
        case .danger:
            return .clear
        }
    }

    var progressColor: MSpinner.MSpinnerColor {
        switch self {
        case .text:
            return .accent
        case .primary:
            return .dark
        case .secondary:
            return .white
        case .danger:
            return .white
        }
    }

}
