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
    
    init(query: Binding<String>) {
        self._query = query
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 26)
            .fill(.white)
            .overlay {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $query)
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 52)
            .padding(.horizontal, 20)
    }
}

#Preview {
    SearchView(query: .constant(""))
        .background(.gray)
}
