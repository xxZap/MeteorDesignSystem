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

    case rainbow
    static let _rainbows: [Color] = [
        Color(#colorLiteral(red: 0.8039215686, green: 0.7803921569, blue: 0.9529411765, alpha: 1)),
        Color(#colorLiteral(red: 0.4431372549, green: 0.4235294118, blue: 0.5803921569, alpha: 1)),
        Color(#colorLiteral(red: 0.2509803922, green: 0.2392156863, blue: 0.3803921569, alpha: 1)),
        Color(#colorLiteral(red: 0.4745098039, green: 0.2823529412, blue: 0.5333333333, alpha: 1)),
        Color(#colorLiteral(red: 0.5098039216, green: 0.3137254902, blue: 0.4823529412, alpha: 1)),
        Color(#colorLiteral(red: 0.768627451, green: 0.3960784314, blue: 0.4980392157, alpha: 1)),
        Color(#colorLiteral(red: 0.9568627451, green: 0.537254902, blue: 0.4509803922, alpha: 1)),
        Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.3921568627, alpha: 1)),
        Color(#colorLiteral(red: 0.9764705882, green: 0.9725490196, blue: 0.4431372549, alpha: 1)),
        Color(#colorLiteral(red: 0.3490196078, green: 0.768627451, blue: 0.6509803922, alpha: 1)),
        Color(#colorLiteral(red: 0.1215686275, green: 0.6705882353, blue: 0.6705882353, alpha: 1)),
        Color(#colorLiteral(red: 0, green: 0.5607843137, blue: 0.6549019608, alpha: 1)),
        Color(#colorLiteral(red: 0.1137254902, green: 0.4509803922, blue: 0.5960784314, alpha: 1)),
        Color(#colorLiteral(red: 0.2156862745, green: 0.3450980392, blue: 0.5019607843, alpha: 1)),
        Color(#colorLiteral(red: 0.4705882353, green: 0.4588235294, blue: 0.5254901961, alpha: 1)),
        Color(#colorLiteral(red: 0.6745098039, green: 0.662745098, blue: 0.7333333333, alpha: 1)),
        Color(#colorLiteral(red: 0.9803921569, green: 0.968627451, blue: 1, alpha: 1))
    ]

    func getColor(for index: Int) -> Color {
        switch self {
        case .red:
            Self._reds[index % Self._reds.count]
        case .pink:
            Self._pinks[index % Self._pinks.count]
        case .rainbow:
            Self._rainbows[index % Self._rainbows.count]
        }
    }

    var colors: [Color] {
        switch self {
        case .red:
            Self._reds
        case .pink:
            Self._pinks
        case .rainbow:
            Self._rainbows
        }
    }
}

extension Color {

    public static let mWhite = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    public static let mWhiteDark = Color(#colorLiteral(red: 0.7843137255, green: 0.7647058824, blue: 0.8156862745, alpha: 1))
    public static let mDanger = Color(#colorLiteral(red: 0.7215686275, green: 0.2392156863, blue: 0.3803921569, alpha: 1))
    public static let mDangerDark = Color(#colorLiteral(red: 0.4470588235, green: 0.2392156863, blue: 0.3803921569, alpha: 1))
    public static let mBackgroundLight = Color(#colorLiteral(red: 0.3474939976, green: 0.3392103717, blue: 0.4708492772, alpha: 1))
    public static let mBackground = Color(#colorLiteral(red: 0.2509803922, green: 0.2392156863, blue: 0.3803921569, alpha: 1))
    public static let mBackgroundDark = Color(#colorLiteral(red: 0.1921568627, green: 0.1725490196, blue: 0.3137254902, alpha: 1))
    public static let mAccent = Color(#colorLiteral(red: 0.937254902, green: 0.7333333333, blue: 0.4901960784, alpha: 1))
    public static let mAccentDark = Color(#colorLiteral(red: 0.6588235294, green: 0.5176470588, blue: 0.3411764706, alpha: 1))
    public static let mLightText = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    public static let mDarkText = Color(#colorLiteral(red: 0.1921568627, green: 0.1725490196, blue: 0.3137254902, alpha: 1))
    public static let mDangerText = Color(#colorLiteral(red: 0.9921568627, green: 0.4862745098, blue: 0.6156862745, alpha: 1))
    public static let mBorder = Color(#colorLiteral(red: 0.3960784314, green: 0.3882352941, blue: 0.5333333333, alpha: 1))

    public static func mGetPaletteColor(_ palette: Palette, forListIndex index: Int) -> Color {
        palette.getColor(for: index)
    }

    public static func mGetPalette(_ palette: Palette) -> [Color] {
        palette.colors
    }
}
