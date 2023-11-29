//
//  Checkbox.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct Checkbox: View {
    init(
        action: @escaping Action = {},
        checked: Bool,
        title: String = ""
    ) {
        self.action = action
        self.checked = checked
        self.title = title
    }
    
    private let action: Action
    private let checked: Bool
    private let title: String
    
    @State private var isOn = false
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.subheading2)
            
            Spacer()
            
            CheckBoxView(action: action, checked: checked)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    Checkbox(checked: false, title: "Checkbox title")
}
