//
//  HeaderView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    let action: () -> Void
    var body: some View {
        HStack(alignment: .center) {
            Text("Calendar")
                .font(.headingRegular)
            
            Spacer()
            
            Image("filter", bundle: .main)
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    action()
                }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    HeaderView(action: {})
}
