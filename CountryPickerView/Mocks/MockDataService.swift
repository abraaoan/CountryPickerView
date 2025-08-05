//
//  MockDataService.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 03/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import Foundation

@available(iOS 15.0.0, *)
actor MockDataService: DataServiceProtocol {
    func loadCountries() async -> [Country] {
        let countries = [
            Country(name: "Brasil", code: "BR", phoneCode: "+55"),
            Country(name: "Portugal", code: "PT", phoneCode: "+351"),
            Country(name: "Australia", code: "AU", phoneCode: "+61"),
            Country(name: "Bahamas", code: "BS", phoneCode: "+1242"),
            Country(name: "Belgium", code: "BE", phoneCode: "+32"),
            Country(name: "Bulgaria", code: "BG", phoneCode: "+359"),
            Country(name: "Central African Republic", code: "CF", phoneCode: "+236"),
            Country(name: "Congo, The Democratic Republic of the Congo", code: "CD", phoneCode: "+243"),
            Country(name: "Hong Kong", code: "HK", phoneCode: "+852"),
            Country(name: "Micronesia, Federated States of Micronesia", code: "FM", phoneCode: "+691"),
            Country(name: "Saint Helena, Ascension and Tristan Da Cunha", code: "SH", phoneCode: "+290"),
            Country(name: "Ilhas Geórgia do Sul e Sandwich do nao sei o que", code: "GS", phoneCode: "+500"),
            Country(name: "Spain", code: "ES", phoneCode: "+34")
        ]
        
        return countries
    }
}
