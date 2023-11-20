//
//  DropDownView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct DropDownView: View {
    let listings: [Listing]
    @State private var isDropdownVisible = false
    @State private var selectedOption = "All"

    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                dropdownButton
                
                if isDropdownVisible {
                    dropdownList
                }
            }
            .padding(.horizontal, 8)
        }
    }
    
    private var dropdownButton: some View {
        HStack {
            Text(selectedOption)
                .font(.subheading2)
                .padding(8)

            Spacer()

            Button(action: {
                isDropdownVisible.toggle()
            }) {
                HStack {
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.gray.opacity(0.8))
                        .rotationEffect(.degrees(isDropdownVisible ? -180 : 0))
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: 0.3)
                }
                .padding(8)
            }
        }
        .padding(8)
        .background(.white)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4))
        }
    }
    
    private var dropdownList: some View {
        VStack(alignment: .leading) {
            ForEach(listings, id: \.self) { option in
                HStack {
                    Button(action: {
                        selectedOption = option.name
                        isDropdownVisible.toggle()
                    }) {
                        Text(option.name)
                            .padding(8)
                            .foregroundColor(.black)
                            .font(.subheading2)
                    }
                    
                    Spacer()
                }
                .frame(height: 50)
            }
        }
        .background(.white)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4))
        }
    }
}

#Preview {
    DropDownView(listings: Listing.dropdownListings)
}
