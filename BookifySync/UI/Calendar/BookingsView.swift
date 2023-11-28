//
//  SectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct BookingsView: View {
    
    let actions: [Action] = generateActions(count: Listing.examples.count)
    let endDate: Date = Date.advanceDate(component: .year)
    let sections: [Listing] = Listing.examples
    let startDate: Date = Date()
    
    let store: StoreOf<BookingsReducer>
            
    @State var events: [Event] = Event.examples
    @State var showListing: Bool = false
    
    var body: some View {
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
                        
                        ForEach(Array(sections.enumerated()), id: \.offset) { index, section in
                            SectionView(
                                action: actions[index],
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
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ForEach(Array(sections.enumerated()), id: \.offset) { sectionIndex, _ in
                Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                    GridRow {
                        ForEach(Array(getDateRange().enumerated()), id: \.offset) { index, _ in
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
    }
    
    private func getDateRange() -> [Date] {
        var currentDate = startDate
        var dates: [Date] = []
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = Date.advanceDate(date: currentDate)
        }
        
        return dates
    }
    
    private func getEvent(dateIndex: Int, sectionIndex: Int) -> Event? {
        events.filter {
            $0.listing.name == sections[sectionIndex].name &&
            $0.startDate.formatDate() == getDateRange()[dateIndex].formatDate()
        }.first
    }
}

#Preview {
    BookingsView(store: Store(initialState: BookingsReducer.State(event: nil)) {
        BookingsReducer()._printChanges()
    })
}
