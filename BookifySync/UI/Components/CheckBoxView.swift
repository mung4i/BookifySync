//
//  CheckBoxView.swift
//  BookifySync
//
//  Created by Martin Mungai on 28/11/2023.
//

import SwiftUI

struct CheckBoxView: View {
    init(
        action: @escaping Action = {},
        checked: Bool
    ) {
        self.action = action
        self.checked = checked
    }
    
    let action: Action
    let checked: Bool
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color.black : Color.backgroundGray)
                .onTapGesture {
                    action()
                }
        }
    }
}

#Preview {
    Group {
        CheckBoxView(checked: false)
        
        CheckBoxView(checked: true)
    }
}

//checkmark.square.fill
