//
//  Country.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 02/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import Foundation

public struct Country: Equatable, Identifiable, Codable {
    public let id: UUID
    public let name: String
    public let code: String
    public let phoneCode: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case code
        case phoneCode = "dial_code"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.code = try container.decode(String.self, forKey: .code)
        self.phoneCode = try container.decode(String.self, forKey: .phoneCode)
        self.id = UUID()
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
        code.lowercased()
    }
    
    static public func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.code == rhs.code
    }
}
