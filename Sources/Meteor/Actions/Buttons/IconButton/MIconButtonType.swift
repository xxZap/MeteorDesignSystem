//
//  MIconButtonType.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

public extension MIconButton {
    enum MIconButtonType {
        case primary
        case secondary
        case accentGhost
        case ghost

        var backgroundColor: Color {
            switch self {
            case .primary:
                return .mAccent
            case .secondary:
                return .mWhite
            case .ghost, .accentGhost:
                return .mBackgroundDark.opacity(0)
            }
        }

        var iconColor: Color {
            switch self {
            case .primary:
                return .mWhite
            case .secondary:
                return .mBackground
            case .accentGhost:
                return .mAccent
            case .ghost:
                return .mWhite
            }
        }

        var pressedColor: Color {
            switch self {
            case .primary:
                return .mAccentDark
            case .secondary:
                return .mWhiteDark
            case .ghost, .accentGhost:
                return .mBackgroundDark
            }
        }

        var borderColor: Color {
            return switch self {
            case .primary:
                    .mWhite
            case .secondary:
                    .clear
            case .ghost, .accentGhost:
                    .clear
            }
        }

        var shadowColor: Color {
            return switch self {
            case .primary:
                    .clear
            case .secondary:
                    .black.opacity(0.4)
            case .ghost, .accentGhost:
                    .clear
            }
        }

        var shadowRadius: CGFloat {
            return switch self {
            case .primary:
                    0
            case .secondary:
                    8
            case .ghost, .accentGhost:
                    0
            }
        }

        var progressColor: MSpinner.MSpinnerColor {
            return switch self {
            case .primary:
                    .white
            case .secondary:
                    .dark
            case .accentGhost:
                    .accent
            case .ghost:
                    .white
            }
        }
    }
}
