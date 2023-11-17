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
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            Image("filter", bundle: .main)
                .resizable()
                .frame(width: 30, height: 30)
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
