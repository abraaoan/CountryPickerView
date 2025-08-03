//
//  CustomLayout.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 03/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import SwiftUICore

public struct CustomLayout {
    public let title: String
    public let preferredTitle: String
    public let searchPlaceholder: String
    public let preferredCountries: [String]
    public let titleFont: Font
    public let rowFont: Font
    public let preferredTitleFont: Font
    public let titleColor: Color
    public let rowColor: Color
    public let preferredTitleColor: Color
    public let closePosition: ClosePosition
    
    public static func `default`() -> Self {
        Self(title: "Select a country",
             preferredTitle: "Preferred Title",
             searchPlaceholder: "Search",
             preferredCountries: ["PT", "BR", "ES"],
             titleFont: .system(size: 18, weight: .medium),
             rowFont: .system(size: 15),
             preferredTitleFont: .system(size: 15, weight: .bold),
             titleColor: .black,
             rowColor: .black.opacity(0.75),
             preferredTitleColor: .black.opacity(0.75),
             closePosition: .trailing
        )
    }
}
