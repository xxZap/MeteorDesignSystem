//
//  SpinnerSize.swift
//
//
//  Created by Alessio Boerio on 21/04/24.
//

import SwiftUI

public extension MSpinner {
    
    enum MSpinnerSize {
        case large
        case regular
        case small

        var controlSize: ControlSize {
            switch self {
            case .large:
                    .large
            case .regular:
                    .regular
            case .small:
                    .small
            }
        }
    }
}
