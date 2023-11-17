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
        VStack {
            HStack {
                Text(selectedOption)
                    .padding(8)

                Spacer()

                Button(action: {
                    isDropdownVisible.toggle()
                }) {
                    HStack {
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.gray.opacity(0.8))
                    }
                    .padding(8)
                }
            }
            .padding(8)
            .background(.white)
            .cornerRadius(8)
            .border(Color.gray.opacity(0.4))
            
            if isDropdownVisible {
                List(listings, id: \.self) { option in
                    Button(action: {
                        selectedOption = option.name
                        isDropdownVisible.toggle()
                    }) {
                        Text(option.name)
                            .padding(8)
                    }
                }
                .listRowSeparator(.hidden)
                .background(.white)
                .cornerRadius(8)
                .border(Color.gray.opacity(0.4))
                .listStyle(PlainListStyle())
                .frame(height: CGFloat(listings.count) * 50)
            }
        }
        .padding(.horizontal, 8)

    }
}

#Preview {
    let listings: [Listing] = [
        Listing(name: "All"),
        Listing(name: "Seaside Cottage"),
        Listing(name: "Mali Apartments"),
        Listing(name: "Lui Homes"),
        Listing(name: "City View"),
        Listing(name: "Zuri Homes"),
    ]
    
    return DropDownView(listings: listings)
}
