//
//  CustomLayout.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 03/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import SwiftUICore

@available(iOS 15.0, *)
public struct CountryCustomLayout {
    public let title: String
    public let preferredTitle: String
    public let searchPlaceholder: String
    public let preferredTitleFont: Font
    public let preferredTitleColor: Color
    public let headerLayout: CountryHeaderLayout
    public let rowLayout: CountryRowLayout
    public let searchLayout: CountrySearchLayout
    
    public init(title: String = "Select a country",
         preferredTitle: String = "Preferred Title",
         searchPlaceholder: String = "Search",
         preferredTitleFont: Font = .system(size: 15, weight: .bold),
         preferredTitleColor: Color = .black.opacity(0.75),
         headerLayout: CountryHeaderLayout = .default(),
         rowLayout: CountryRowLayout = .default(),
         searchLayout: CountrySearchLayout = .default()) {
        self.title = title
        self.preferredTitle = preferredTitle
        self.searchPlaceholder = searchPlaceholder
        self.preferredTitleFont = preferredTitleFont
        self.preferredTitleColor = preferredTitleColor
        self.headerLayout = headerLayout
        self.rowLayout = rowLayout
        self.searchLayout = searchLayout
    }
    
    public static func `default`() -> Self {
        Self(title: "Select a country",
             preferredTitle: "Preferred Title",
             searchPlaceholder: "Search",
             preferredTitleFont: .system(size: 15, weight: .bold),
             preferredTitleColor: .black.opacity(0.75),
             headerLayout: .default(),
             rowLayout: .default(),
             searchLayout: .default(),
        )
    }
}

public struct CountryHeaderLayout {
    public let titleFont: Font
    public let titleColor: Color
    public let closePosition: ClosePosition
    
    public init(titleFont: Font = .system(size: 16, weight: .bold),
         titleColor: Color = .black.opacity(0.8),
         closePosition: ClosePosition = .trailing) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.closePosition = closePosition
    }
    
    public static func `default`() -> Self {
        Self(titleFont: .system(size: 18, weight: .medium),
             titleColor: .black,
             closePosition: .trailing)
    }
}

public struct CountryRowLayout {
    public let font: Font
    public let color: Color
    
    public init(font: Font = .system(size: 15),
         color: Color = .black.opacity(0.75)) {
        self.font = font
        self.color = color
    }
    
    public static func `default`() -> Self {
        Self(font: .system(size: 15), color: .black.opacity(0.75))
    }
}

public struct CountrySearchLayout {
    public let iconColor: Color
    public let font: Font
    public let textColor: Color
    
    public init(iconColor: Color = .black, font: Font = .system(size: 15), textColor: Color = .black) {
        self.iconColor = iconColor
        self.font = font
        self.textColor = textColor
    }
    
    public static func `default`() -> Self {
        Self(iconColor: .black, font: .system(size: 15), textColor: .black)
    }
}
