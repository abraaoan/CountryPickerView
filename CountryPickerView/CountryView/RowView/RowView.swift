//
//  RowView.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 03/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import SwiftUI

struct RowView: View {
    let image: UIImage
    let text: String
    let font: Font
    let color: Color
    @State var isSelected: Bool
    
    init(image: UIImage,
         text: String,
         isSelected: Bool = false,
         font: Font = .system(size: 15),
         color: Color = .black) {
        self.image = image
        self.text = text
        self.isSelected = isSelected
        self.font = font
        self.color = color
    }
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: Constants.height / 2)
                .fill(.white)
                .overlay {
                    HStack {
                        Image(uiImage: image)
                            .clipShape(Circle())
                        Text(text)
                            .font(font)
                            .foregroundColor(color)
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
        .padding(.horizontal, 20)
    }
}

extension RowView {
    private enum Constants {
        static let height = 50.0
    }
}

#Preview {
    let image = UIImage(named: "BR", in: ._module, compatibleWith: nil)!
    let image2 = UIImage(named: "GS", in: ._module, compatibleWith: nil)!
    VStack {
        Spacer()
        RowView(image: image, text: "Brasil (+55)", isSelected: true)
        RowView(image: image2, text: "Ilhas Geórgia do Sul e Sandwich do nao sei o que (+500)", isSelected: true)
        RowView(image: image2, text: "Ilhas Geórgia do Sul e Sandwich do nao sei o que (+500)")
        Spacer()
    }
    .background {
        LinearGradient(colors: [.gray, .white],
                       startPoint: .top,
                       endPoint: .bottom)
    }
    .ignoresSafeArea(.all)
}
