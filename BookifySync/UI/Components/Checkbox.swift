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
        title: String = ""
    ) {
        self.action = action
        self.title = title
    }
    
    private let action: Action
    private let title: String
    
    @State private var isOn = false
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.subheading2)
            
            Spacer()
            
            
            CheckBoxView(action: { isOn.toggle() }, checked: isOn)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    Checkbox(title: "Checkbox title")
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square": "square")
                    .foregroundColor(.black)
            }
        }
    }
}
