//
//  MIconButtonSize.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import Foundation

public extension MIconButton {

    /// The possible sizes an **MIconButton** can have.
    ///
    /// Each **MIconButtonSize** has predefined and not-customizable:
    /// - paddings
    /// - loader size
    enum MIconButtonSize {
        case small
        case regular

        var padding: CGFloat {
            switch self {
            case .small:
                8
            case .regular:
                12
            }
        }

        var iconSize: CGFloat {
            switch self {
            case .small:
                16
            case .regular:
                24
            }
        }

        var controlSize: MSpinner.MSpinnerSize {
            switch self {
            case .small:
                    .small
            case .regular:
                    .regular
            }
        }
    }
}
