//
//  RowView.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 03/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct RowView: View {
    let flag: String
    let text: String
    let isSelected: Bool
    let rowLayout: CountryRowLayout
    
    init(flag: String,
         text: String,
         isSelected: Bool = false,
         rowLayout: CountryRowLayout = .default()) {
        self.flag = flag
        self.text = text
        self.isSelected = isSelected
        self.rowLayout = rowLayout
    }
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: Constants.height / 2)
                .fill(.white)
                .overlay {
                    HStack {
                        Image(flag, bundle: .module)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        Text(text)
                            .font(rowLayout.font)
                            .foregroundColor(rowLayout.color)
                        Spacer()
                        if isSelected {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                                .padding(.trailing, 10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: Constants.height)
        .padding(.horizontal, 15)
    }
}

@available(iOS 15.0, *)
extension RowView {
    private enum Constants {
        static let height = 50.0
    }
}

@available(iOS 15.0, *)
#Preview {
    
    VStack {
        Spacer()
        RowView(flag: "br", text: "Brasil (+55)", isSelected: true)
        RowView(flag: "br", text: "Ilhas Geórgia do Sul e Sandwich do nao sei o que (+500)", isSelected: true)
        RowView(flag: "gs", text: "Ilhas Geórgia do Sul e Sandwich do nao sei o que (+500)")
        Spacer()
    }
    .background(.gray.opacity(0.15))
    .ignoresSafeArea(.all)
}
