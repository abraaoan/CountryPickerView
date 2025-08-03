//
//  SearchView.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 02/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var query: String
    let placeholder: String
    
    init(query: Binding<String>, placeholder: String = "Search") {
        self._query = query
        self.placeholder = placeholder
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 26)
            .fill(.white)
            .overlay {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField(placeholder, text: $query)
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 52)
            .padding(.horizontal, 20)
    }
}

#Preview {
    VStack {
        SearchView(query: .constant(""), placeholder: "Search here")
            .padding(.top, 100)
        Spacer()
    }
    .background { LinearGradient(
        colors: [.gray, .white],
        startPoint: .top,
        endPoint: .bottom)
    }
    .ignoresSafeArea(.all)
        
}
