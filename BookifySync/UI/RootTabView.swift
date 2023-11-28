//
//  RootTabView.swift
//  BookifySync
//
//  Created by Martin Mungai on 28/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct RootTabView: View {
    let store: StoreOf<CalendarReducer>

    @State private var selectedTab: TabSelectionState = .calendar
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MessagesView()
            
            OffersView()
            
            CalendarView(store: store)
            
            BookingsView()
            
            MenuView()
        }
        .accentColor(.primaryRed)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RootTabView(store: CalendarReducer.mockStore())
}
