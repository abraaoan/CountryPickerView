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
    var customLayout: CountryCustomLayout
    var onSelect: ((Country) -> Void)
    public var onClose: (() -> Void)? // For UIKit when needed.
    @Environment(\.dismiss) var dismiss
    @State private var countries: [Country] = []
    @State private var query: String = ""
    @State private var selectedCountry: Country?
    @State private var preferredCountries: [String]
    
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
        let preferredCountries = self.preferredCountries.compactMap { code in
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
                customLayout: CountryCustomLayout = .default(),
                preferredCountries: [String] = [],
                onSelect: @escaping ((Country) -> Void)) {
        self.service = service
        self.customLayout = customLayout
        self.selectedCountry = selectedCountry
        self.preferredCountries = preferredCountries
        self.onSelect = onSelect
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 25)
                .fill(.clear)
                .ignoresSafeArea(.all, edges: .top)
                .frame(height: 120)
                .overlay {
                    VStack {
                        HeaderView(title: customLayout.title, onCloseTapped: {
                            dismiss()
                            onClose?()
                        })
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        SearchView(query: $query, placeholder: customLayout.searchPlaceholder)
                    }
                }
                
            ScrollView(showsIndicators: false) {
                
                if filteredPreferedCountries.count > 0 {
                    LazyVStack(spacing: 8) {
                        Text(customLayout.preferredTitle.uppercased())
                            .font(customLayout.preferredTitleFont)
                            .foregroundColor(customLayout.preferredTitleColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .padding(.top, 10)
                        ForEach(filteredPreferedCountries) { country in
                            RowView(flag: country.flagName,
                                    text: "\(country.localizedName() ?? country.name) (\(country.phoneCode))",
                                    isSelected: country == selectedCountry)
                            .onTapGesture {
                                selectedCountry = country
                                onSelect(country)
                                dismiss()
                            }
                        }
                    }
                    .padding(.top, 8)
                }
                
                LazyVStack(spacing: 8) {
                    ForEach(filteredCountries.filter { !filteredPreferedCountries.contains($0)  }) { country in
                        RowView(flag: country.flagName,
                                text: "\(country.localizedName() ?? country.name) (\(country.phoneCode))",
                                isSelected: country == selectedCountry)
                        .onTapGesture {
                            selectedCountry = country
                            onSelect(country)
                            dismiss()
                        }
                    }
                }.padding(.top, filteredPreferedCountries.count > 0 ? 40 : 8)
            }
            
        }
        .background(.gray.opacity(0.15))
        .task {
            countries = await service.loadCountries()
        }
    }
}

@available(iOS 15.0, *)
#Preview {
    let service = MockDataService()
    CountryView(service: service) { _ in 
        
    }
}
