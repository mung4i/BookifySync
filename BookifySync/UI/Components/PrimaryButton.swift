//
//  PrimaryButton.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct PrimaryButton: View {
    init(
        action: @escaping Action = {},
        title: String = "",
        isPrimary: Bool = false
    ) {
        self.action = action
        self.title = title
        self.isPrimary = isPrimary
    }
    
    
    let action: Action
    let title: String
    let isPrimary: Bool
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.subheading2)
                    .frame(width: 104, height: 42, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(isPrimary ? .white : .primaryRed)
                    .background(isPrimary ? Color.primaryRed: .white)
            }
        }
        .shadow(color: Color(red: 0.86, green: 0.86, blue: 0.86), radius: 45, x: 20, y: 20)
        .shadow(color: .black.opacity(0.05), radius: 20, x: -20, y: -20)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    Group {
        PrimaryButton(action: {}, title: "Clear", isPrimary: false)
        
        PrimaryButton(action: {}, title: "Apply", isPrimary: true)
    }
}
