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
                .tabItem(
                    imageTitle: "calendar",
                    isSelected: selectedTab == .calendar,
                    title: "Calendar")
            
            MessagesView()
                .tabItem(
                    imageTitle: "messages",
                    isSelected: selectedTab == .messages,
                    title: "Messages")
            
            OffersView()
                .tabItem(
                    imageTitle: "gift",
                    isSelected: selectedTab == .offers,
                    title: "Offers")
            
            BookingsView()
                .tabItem(
                    imageTitle: "bookings",
                    isSelected: selectedTab == .bookings,
                    title: "Bookings")
            
            MenuView()
                .tabItem(
                    imageTitle: "menu",
                    isSelected: selectedTab == .menu,
                    title: "Menu")
        }
        .accentColor(.primaryRed)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RootTabView(store: CalendarReducer.mockStore())
}
