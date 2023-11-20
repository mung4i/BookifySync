//
//  FilterView.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HeaderView(title: "Filter", imageTitle: "cancel", imageDimension: 56)
            
            Divider()
                .padding(.horizontal, 16)
            
            Text("Booking platform")
                .font(.headingRegular)
                .padding(.horizontal, 16)
            
            
            VStack(alignment: .leading, spacing: 32) {
                ForEach(Platforms.allCases, id: \.self) { platform in
                    Checkbox(title: platform.rawValue)
                }
            }
            
            Spacer()
            
            Divider()
                .padding(.horizontal, 16)
            
            HStack(alignment: .center) {
                PrimaryButton(action: {}, title: "Clear", isPrimary: false)
                
                Spacer()
                
                PrimaryButton(action: {}, title: "Apply", isPrimary: true)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FilterView()
}
