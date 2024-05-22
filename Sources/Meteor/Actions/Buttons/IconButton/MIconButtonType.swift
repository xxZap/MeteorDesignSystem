//
//  MIconButtonType.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

public extension MIconButton {

    /// The possible types an **MIconButton** can have.
    ///
    /// Each **MIconButtonType** has predefined and not-customizable:
    ///
    /// * background color
    /// * icon color
    /// * pressed color
    /// * border color
    /// * shadow color
    /// * shadow radius
    /// * loader color
    enum MIconButtonType {
        case primary
        case secondary
        case primaryGhost
        case secondaryGhost

        var backgroundColor: Color {
            switch self {
            case .primary:
                return .mAccent
            case .secondary:
                return .mWhite
            case .secondaryGhost, .primaryGhost:
                return .mBackgroundDark.opacity(0)
            }
        }

        var iconColor: Color {
            switch self {
            case .primary:
                return .mWhite
            case .secondary:
                return .mBackground
            case .primaryGhost:
                return .mAccent
            case .secondaryGhost:
                return .mWhite
            }
        }

        var pressedColor: Color {
            switch self {
            case .primary:
                return .mAccentDark
            case .secondary:
                return .mWhiteDark
            case .secondaryGhost, .primaryGhost:
                return .mBackgroundDark
            }
        }

        var borderColor: Color {
            return switch self {
            case .primary:
                    .mWhite
            case .secondary:
                    .clear
            case .secondaryGhost, .primaryGhost:
                    .clear
            }
        }

        var shadowColor: Color {
            return switch self {
            case .primary:
                    .clear
            case .secondary:
                    .black.opacity(0.4)
            case .secondaryGhost, .primaryGhost:
                    .clear
            }
        }

        var shadowRadius: CGFloat {
            return switch self {
            case .primary:
                    0
            case .secondary:
                    8
            case .secondaryGhost, .primaryGhost:
                    0
            }
        }

        var progressColor: MSpinner.MSpinnerColor {
            return switch self {
            case .primary:
                    .white
            case .secondary:
                    .dark
            case .primaryGhost:
                    .accent
            case .secondaryGhost:
                    .white
            }
        }
    }
}
