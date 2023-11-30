//
//  DropDownView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct DropDownView: View {
    let store: StoreOf<DropdownReducer>
    
    let listings: [Listing] = Listing.dropdownListings
    @State private var isDropdownVisible = false

    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                dropdownButton
                
                if isDropdownVisible {
                    dropdownList
                }
            }
        }
    }
    
    private var dropdownButton: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Text(viewStore.filter.rawValue)
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
    }
    
    private var dropdownList: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                ForEach(listings, id: \.self) { option in
                    HStack {
                        Button(action: {
                            isDropdownVisible.toggle()
                            viewStore.send(.filterTapped(FilterKey(rawValue: option.name) ?? .all))
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
}

#Preview {
    DropDownView(store: Store(
        initialState: DropdownReducer.State(filter: .all, id: UUID())
    ) {
        DropdownReducer()._printChanges()
    })
    .padding(.horizontal, 8)
}
