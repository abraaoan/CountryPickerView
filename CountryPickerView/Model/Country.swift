//
//  Country.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 02/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

public struct Country: Equatable, Identifiable, Codable {
    public let id: UUID
    public let name: String
    public let code: String
    public let phoneCode: String
    
    private enum codeKeys: String, CodingKey {
        case name, code, phoneCode
    }
    
    init(name: String, code: String, phoneCode: String) {
        self.id = UUID()
        self.name = name
        self.code = code
        self.phoneCode = phoneCode
    }
    
    public func localizedName(_ locale: Locale = Locale.current) -> String? {
        return locale.localizedString(forRegionCode: code)
    }
    
    public var flagName: String {
        code.uppercased()
    }
    
    static public func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.code == rhs.code
    }
}
