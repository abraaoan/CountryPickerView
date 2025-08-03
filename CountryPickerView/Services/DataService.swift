//
//  DataService.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 03/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import Foundation

protocol DataServiceProtocol {
    func loadCountries() async -> [Country]
}

actor DataService: DataServiceProtocol {
    func loadCountries() -> [Country] {
        let path = Bundle._module.path(forResource: Constants.path, ofType: Constants.fileType) ??
        Bundle._module.path(forResource: Constants.resource, ofType: Constants.fileType)
        guard let jsonPath = path,
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            let countries = try decoder.decode([Country].self, from: jsonData)
            return countries
        } catch {
            print("[DataService]: fail to load\n \(error)")
        }

        return []
    }
}

extension DataService {
    private enum Constants {
        static let path = "Data/CountryCodes"
        static let fileType = "json"
        static let resource = "CountryCodes"
    }
}
