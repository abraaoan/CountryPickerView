//
//  SwiftUIView.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 02/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CountryView: View {
    var service: DataServiceProtocol
    var customLayout: CustomLayout
    @Environment(\.dismiss) var dismiss
    @State private var countries: [Country] = []
    @State private var query: String = ""
    @State private var selectedCountry: Country?
    
    private var filteredCountries: [Country] {
        if query.isEmpty {
            return countries
        }
        
        return countries.filter {
            ($0.localizedName() ?? $0.name).lowercased().contains(query.lowercased()) ||
            $0.code.lowercased().contains(query.lowercased())  ||
            $0.phoneCode.contains(query.lowercased())
        }
    }
    
    private var filteredPreferedCountries: [Country] {
        let preferredCountries = customLayout.preferredCountries.compactMap { code in
            countries.first( where: { code == $0.code } )
        }
        
        if query.isEmpty {
            return preferredCountries
        }
        
        return preferredCountries.filter {
            ($0.localizedName() ?? $0.name).lowercased().contains(query.lowercased()) ||
            $0.code.lowercased().contains(query.lowercased())  ||
            $0.phoneCode.contains(query.lowercased())
        }
    }
    
    public init(service: DataServiceProtocol = DataService(),
         selectedCountry: Country? = nil,
         customLayout: CustomLayout = .default()) {
        self.service = service
        self.customLayout = customLayout
        self.selectedCountry = selectedCountry
    }
    
    public var body: some View {
        VStack {
            HeaderView(title: customLayout.title,
                       closePosition: customLayout.closePosition,
                       onCloseTapped: { dismiss() })
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            SearchView(query: $query, placeholder: customLayout.searchPlaceholder)
            ScrollView {
                
                if filteredPreferedCountries.count > 0 {
                    LazyVStack(spacing: 8) {
                        Text(customLayout.preferredTitle.uppercased())
                            .font(customLayout.preferredTitleFont)
                            .foregroundColor(customLayout.preferredTitleColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .padding(.top, 10)
                        ForEach(filteredPreferedCountries) { country in
                            RowView(image: country.flag,
                                    text: "\(country.localizedName() ?? country.name) (\(country.phoneCode))",
                                    isSelected: country == selectedCountry,
                                    font: customLayout.rowFont,
                                    color: customLayout.rowColor)
                            .onTapGesture {
                                selectedCountry = country
                            }
                        }
                    }
                }
                
                LazyVStack(spacing: 8) {
                    ForEach(filteredCountries.filter { !filteredPreferedCountries.contains($0)  }) { country in
                        RowView(image: country.flag,
                                text: "\(country.localizedName() ?? country.name) (\(country.phoneCode))",
                                isSelected: country == selectedCountry,
                                font: customLayout.rowFont,
                                color: customLayout.rowColor)
                        .onTapGesture {
                            selectedCountry = country
                        }
                    }
                }.padding(.top, filteredPreferedCountries.count > 0 ? 40 : 0)
            }
        }
        .background(
            LinearGradient(
                colors: [.gray, .gray.opacity(0.25)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .task {
            countries = await service.loadCountries()
        }
    }
}

@available(iOS 15.0, *)
#Preview {
    let service = MockDataService()
    CountryView(service: service)
}
