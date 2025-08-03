//
//  SwiftUIView.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 02/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import SwiftUI

struct CountryView: View {
    var service: DataServiceProtocol
    @State private var countries: [Country] = []
    @State private var query: String = ""
    
    private var filteredCountries: [Country] {
        if query.isEmpty {
            return countries
        }
        
        return countries.filter { ($0.localizedName() ?? $0.name).lowercased().contains(query.lowercased()) }
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    Circle()
                        .fill(.white)
                        .overlay {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        }
                        .frame(width: 40, height: 40)
                }
                Spacer()
                Text("Select a country")
                    .padding(.leading, -40)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            SearchView(query: $query)
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(filteredCountries) { country in
                        RowView(image: country.flag,
                                text: "\(country.localizedName() ?? country.name) (\(country.phoneCode))")
                    }
                }
            }
        }
        .background(
            LinearGradient(
                colors: [.gray, .white],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .task {
            countries = await service.loadCountries()
        }
    }
}

#Preview {
    let service = MockDataService()
    CountryView(service: service)
}
