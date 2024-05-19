//
//  DesignSystem.swift
//  FeedYourPassions
//
//  Created by Alessio Boerio on 20/04/24.
//

import SwiftUI

public enum Palette {
    case red
    static let _reds: [Color] = [
        Color(#colorLiteral(red: 0.9411764706, green: 0.5019607843, blue: 0.5019607843, alpha: 1)),
        Color(#colorLiteral(red: 0.9568627451, green: 0.5921568627, blue: 0.5568627451, alpha: 1)),
        Color(#colorLiteral(red: 0.9725490196, green: 0.6784313725, blue: 0.6156862745, alpha: 1)),
        Color(#colorLiteral(red: 0.9843137255, green: 0.768627451, blue: 0.6705882353, alpha: 1)),
        Color(#colorLiteral(red: 1, green: 0.8549019608, blue: 0.7254901961, alpha: 1))
    ]

    case pink
    static let _pinks: [Color] = [
        Color(#colorLiteral(red: 0.8431372549, green: 0.8196078431, blue: 0.9921568627, alpha: 1)),
        Color(#colorLiteral(red: 1, green: 0.7921568627, blue: 0.9803921569, alpha: 1)),
        Color(#colorLiteral(red: 1, green: 0.768627451, blue: 0.8666666667, alpha: 1)),
        Color(#colorLiteral(red: 1, green: 0.7882352941, blue: 0.6901960784, alpha: 1)),
        Color(#colorLiteral(red: 1, green: 0.8666666667, blue: 0.5137254902, alpha: 1))
    ]

    func getColor(for index: Int) -> Color {
        switch self {
        case .red:
            Self._reds[index % Self._reds.count]
        case .pink:
            Self._pinks[index % Self._pinks.count]
        }
    }
}

extension Color {

    public static let mWhite = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    public static let mWhiteDark = Color(#colorLiteral(red: 0.7843137255, green: 0.7647058824, blue: 0.8156862745, alpha: 1))
    public static let mDanger = Color(#colorLiteral(red: 0.7202884279, green: 0.2392156863, blue: 0.3803921569, alpha: 1))
    public static let mDangerDark = Color(#colorLiteral(red: 0.445628564, green: 0.2392156863, blue: 0.3803921569, alpha: 1))
    public static let mBackground = Color(#colorLiteral(red: 0.2509803922, green: 0.2392156863, blue: 0.3803921569, alpha: 1))
    public static let mBackgroundDark = Color(#colorLiteral(red: 0.1921568627, green: 0.1725490196, blue: 0.3137254902, alpha: 1))
    public static let mAccent = Color(#colorLiteral(red: 0.9019607843, green: 0.7647058824, blue: 0.5764705882, alpha: 1))
    public static let mAccentDark = Color(#colorLiteral(red: 0.8039215686, green: 0.6470588235, blue: 0.4392156863, alpha: 1))
    public static let mLightText = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    public static let mDarkText = Color(#colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.1254901961, alpha: 1))
    public static let mDangerText = Color(#colorLiteral(red: 0.9937790742, green: 0.4848842662, blue: 0.6147140106, alpha: 1))
    public static let mBorder = Color(#colorLiteral(red: 0.395883666, green: 0.3895930247, blue: 0.5345163066, alpha: 1))

    public static func mGetPaletteColor(_ palette: Palette, forListIndex index: Int) -> Color {
        palette.getColor(for: index)
    }
}
