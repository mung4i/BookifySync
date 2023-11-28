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
            CalendarView(store: store)
            
            MessagesView()
            
            OffersView()
            
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
