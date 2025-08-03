//
//  Country.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 03/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import Foundation

extension Country {
    public var flag: UIImage {
        return UIImage(named: "Images/\(flagName)", in: Bundle._module, compatibleWith: nil) ??
            UIImage.init(named: flagName, in: Bundle._module, compatibleWith: nil)!
    }
}
