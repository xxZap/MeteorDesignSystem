//
//  MButtonSize.swift
//  FeedYourPassions
//
//  Created by Alessio Boerio on 19/05/24.
//

import Foundation

public extension MButton {

    /// The possible sizes an **MButton** can have.
    ///
    /// Each **MButtonSize** has predefined and not-customizable:
    /// - paddings
    /// - min height value
    enum MButtonSize {
        case small
        case regular

        func toString() -> String {
            switch self {
            case .small:
                "small"
            case .regular:
                "regular"
            }
        }

        var horizontalPadding: CGFloat {
            switch self {
            case .small:
                12
            case .regular:
                20
            }
        }

        var verticalPadding: CGFloat {
            switch self {
            case .small:
                4
            case .regular:
                12
            }
        }

        var minHeight: CGFloat {
            switch self {
            case .small:
                32
            case .regular:
                48
            }
        }
    }
}
