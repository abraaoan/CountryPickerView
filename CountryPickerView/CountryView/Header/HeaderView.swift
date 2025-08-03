//
//  HeaderView.swift
//  CountryPickerView
//
//  Created by Abraao Nascimento on 03/08/2025.
//  Copyright © 2025 Kizito Nwose. All rights reserved.
//

import SwiftUI

public enum ClosePosition {
    case leading, trailing
}

struct HeaderView: View {
    let title: String
    let titleFont: Font
    let closePosition: ClosePosition
    var onCloseTapped: (() -> Void)?
    
    init(title: String,
         titleFont: Font = .system(size: 18),
         closePosition: ClosePosition = .trailing,
         onCloseTapped: (() -> Void)? = nil) {
        self.title = title
        self.titleFont = titleFont
        self.closePosition = closePosition
    }
    
    var body: some View {
        HStack {
            if closePosition == .leading {
                Button { onCloseTapped?() } label: {
                    Circle()
                        .fill(.white)
                        .overlay {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        }
                        .frame(width: 40, height: 40)
                }
                Spacer()
                Text(title)
                    .font(titleFont)
                    .padding(.leading, -40)
                Spacer()
            } else if closePosition == .trailing {
                Spacer()
                Text(title)
                    .font(titleFont)
                    .padding(.leading, 40)
                Spacer()
                Button { onCloseTapped?() } label: {
                    Circle()
                        .fill(.white)
                        .overlay {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        }
                        .frame(width: 40, height: 40)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
}

#Preview {
    VStack {
        HeaderView(title: "Select a country bellow", closePosition: .trailing, onCloseTapped: {
            print("close button tapped!")
        }).padding(.top, 100)
        Spacer()
    }
    .background {
        LinearGradient(
            colors: [.gray, .white],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    .ignoresSafeArea(.all)
}
