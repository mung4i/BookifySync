//
//  Checkbox.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct Checkbox: View {
    init(title: String = "") {
        self.title = title
    }
    
    @State private var isOn = false
    let title: String
    
    var body: some View {
        
        HStack(alignment: .center) {
            Text(title)
                .font(.subheading2)
            
            Spacer()
            
            Toggle(isOn: $isOn) {}
            .toggleStyle(CheckboxToggleStyle())
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
