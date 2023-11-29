//
//  FilterView.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct FilterView: View {
    
    let store: StoreOf<FilterReducer>
    @Environment(\.dismiss) var dismiss

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading, spacing: 16) {
                HeaderView(
                    action: { dismiss() },
                    title: "Filter",
                    imageTitle: "cancel",
                    imageDimension: 56)
                
                Divider()
                    .padding(.horizontal, 16)
                
                Text("Booking platform")
                    .font(.headingRegular)
                    .padding(.horizontal, 16)
                
                
                VStack(alignment: .leading, spacing: 32) {
                    ForEach(viewStore.state.platform, id: \.self) { platform in
                        Checkbox(
                            action: { viewStore.send(.checkBoxTapped(platform))},
                            checked: viewStore.filterState[platform] ?? false,
                            title: platform.rawValue)
                    }
                }
                
                Spacer()
                
                Divider()
                    .padding(.horizontal, 16)
                
                HStack(alignment: .center) {
                    PrimaryButton(
                        action: { viewStore.send(.clear) },
                        title: "Clear",
                        isPrimary: false)
                    
                    Spacer()
                    
                    PrimaryButton(
                        action: { dismiss() },
                        title: "Apply",
                        isPrimary: true)
                }
                .padding(.horizontal, 16)
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    FilterView(store: Store(initialState: FilterReducer.State()) {
        FilterReducer()._printChanges()
    })
}
