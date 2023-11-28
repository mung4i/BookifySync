//
//  SectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct CalendarBookingsView: View {
    
    let endDate: Date = Date.advanceDate(component: .month)
    let sections: [Listing] = Listing.examples
    let startDate: Date = Date()
    
    let store: StoreOf<BookingsReducer>
            
    @State var events: [Event] = Event.examples
    @State var showListing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            IfLetStore(
                self.store.scope(
                    state: \.dropdown,
                    action: { .dropdown($0) }
                )
            ) { store in
                DropDownView(store: store)
                    .padding(.top, 16)
                    .frame(width: 280)
                    .opacity(1)
                    .zIndex(10)
                
            }
            
            outerGrid()
        }
    }
    
    private func outerGrid() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        SectionView(
                            sectionTitle: "Listings",
                            width: 150,
                            height: 100,
                            backgroundColor: Color.backgroundGray)
                        .background(Color.backgroundGray)
                        
                        ForEach(0..<sections.count, id: \.self) { index in
                            let section = sections[index]
                            SectionView(
                                sectionTitle: section.name,
                                width: 150,
                                backgroundColor: Color.backgroundGray)
                            .background(Color.backgroundGray)
                        }
                    }
                    
                    VStack(spacing: 0) {
                        CalendarListView(
                            startDate: startDate,
                            endDate: endDate,
                            events: events,
                            height: 100)
                        
                        grid()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4))
            }
        }
    }
    
    private func grid() -> some View {
        ForEach(0..<sections.count, id: \.self) { sectionIndex in
            innerGrid(sectionIndex)
        }
    }
    
    private func innerGrid(_ sectionIndex: Int) -> some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                GridRow {
                    ForEach(0..<getDateRange().count, id: \.self) { index in
                        let event = getEvent(dateIndex: index, sectionIndex: sectionIndex)
                        SectionView()
                            .pillView(
                                action: { viewStore.send(.showBooking(event)) },
                                name: event?.title ?? "",
                                width: event?.width ?? 150,
                                padding: 125,
                                isHidden: event == nil
                            )
                    }
                }
            }
        }
    }
    
    private func getDateRange() -> [Date] {
        Date.now.getDates(
            start: startDate,
            endDate: endDate)
    }
    
    private func getEvent(dateIndex: Int, sectionIndex: Int) -> Event? {
        events.getEvent(
            dateIndex: dateIndex,
            dates: getDateRange(),
            sections: sections,
            sectionIndex: sectionIndex)
    }
}

#Preview {
    CalendarBookingsView(store: Store(initialState: BookingsReducer.State(event: nil)) {
        BookingsReducer()._printChanges()
    })
}
