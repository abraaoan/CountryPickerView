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

@available(iOS 15.0, *)
struct HeaderView: View {
    let title: String
    let headerLayout: CountryHeaderLayout
    var onCloseTapped: (() -> Void)?
    
    init(title: String,
         headerLayout: CountryHeaderLayout = .default(),
         closePosition: ClosePosition = .trailing,
         onCloseTapped: (() -> Void)? = nil) {
        self.title = title
        self.headerLayout = headerLayout
        self.onCloseTapped = onCloseTapped
    }
    
    var body: some View {
        HStack {
            if headerLayout.closePosition == .leading {
                Button { onCloseTapped?() } label: {
                    Circle()
                        .fill(.white)
                        .overlay {
                            Image(systemName: "xmark")
                        }
                        .frame(width: 40, height: 40)
                }
                Spacer()
                Text(title)
                    .font(headerLayout.titleFont)
                    .padding(.leading, -40)
                Spacer()
            } else if headerLayout.closePosition == .trailing {
                Spacer()
                Text(title)
                    .font(headerLayout.titleFont)
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
        .foregroundColor(headerLayout.titleColor)
        .padding(.horizontal, 15)
        .padding(.top, -30)
        .foregroundColor(.black)
    }
}

@available(iOS 15.0, *)
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
