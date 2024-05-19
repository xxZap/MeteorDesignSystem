//
//  MSpinnerColor.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

public extension MSpinner {

    enum MSpinnerColor {
        case dark
        case white
        case accent

        var color: Color {
            switch self {
            case .dark:
                    .mBackground
            case .white:
                    .mWhite
            case .accent:
                    .mAccent
            }
        }
    }
}
