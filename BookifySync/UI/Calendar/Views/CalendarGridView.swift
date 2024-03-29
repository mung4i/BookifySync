//
//  CalendarGridView.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct CalendarGridView: View {
    let sectionIndex: Int
    let store: StoreOf<CalendarGridReducer>
    let month: Int
    let year: Int
    let startDate: Date
    let endDate: Date

    private let calendar = Calendar.current
    private let columns = Array(
        repeating: GridItem(.fixed(50), spacing: 0, alignment: .top),
        count: 7)
    private let events = Event.examples
    private let sections = Listing.dropdownListings
    
    init(
        sectionIndex: Int = 0,
        store: StoreOf<CalendarGridReducer>,
        month: Int = Date.now.toNumber(),
        year: Int = Date.now.toNumber(format: "YYYY")
    ) {
        self.sectionIndex = sectionIndex
        self.store = store
        self.month = month
        self.year = year
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        
        self.startDate = calendar.date(from: components) ?? Date()
        
        components.month = month + 1
        self.endDate = calendar.date(from: components)?.addingTimeInterval(-1) ?? Date()
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            IfLetStore(
                self.store.scope(
                    state: \.dropDown,
                    action: { .dropdown($0)})
            ) { store in
                DropDownView(store: store)
                    .padding(.top, 16)
                    .frame(width: 280, height: 44)
                    .opacity(1)
                    .zIndex(10)
            }
            
            
            Spacer()
                .frame(maxHeight: 32)
            
            Text(Date.now.formatDate("MMMM"))
                .font(.headingRegular)
                .padding(.leading, 20)
            
            VStack(spacing: .zero) {
                upperGrid()
                lowerGrid()
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func calendarCellBuilder(
        date: Date,
        for event: Event?
    ) -> some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            let day = date.formatDate("d")
            if let event {
                CalendarCell(day: day, showTitle: date.inRange(start: event.startDate, end: event.endDate))
                    .pillView(
                        action: { viewStore.send(.booking(event)) },
                        name: event.title,
                        width: event.gridWidth,
                        height: 34,
                        platform: event.platform,
                        padBottom: true)
            } else {
                CalendarCell(day: day, showTitle: dateHasEvent(date: date))
            }
        }
        
    }
    
    private func dateHasEvent(date: Date) -> Bool {
        events.hasEvent(date: date, id: sectionIndex)
    }

    private func getDates() -> [Date] {
        Date.now.getDates(
            start: startDate,
            endDate: endDate)
    }
    
    private func getEvent(
        dateIndex: Int,
        sectionIndex: Int,
        platforms: [Platform: Bool] = Platform.defaultState
    ) -> Event? {
        events.getEvent(
            dateIndex: dateIndex,
            dates: getDates(),
            sections: sections,
            sectionIndex: sectionIndex,
            platforms: platforms)
    }
    
    private func lowerGrid() -> some View {
        WithViewStore(store, observe: { $0}) { viewStore in
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(getDates(), id: \.self) { date in
                    let event = getEvent(
                        dateIndex: date.toDay() - 1,
                        sectionIndex: sectionIndex,
                        platforms: viewStore.filterState
                    )
                    
                    HStack(spacing: 0) {
                        calendarCellBuilder(
                            date: date,
                            for: event)
                    }
                }
            }
        }
    }
    
    private func upperGrid() -> some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<7, id: \.self) { index in
                    let date = getDates()[index]
                    CalendarCell(
                        day: date.formatDate("E"),
                        height: 66,
                        showTitle: false)
                }
            }
        }
    }
}

#Preview {
    CalendarGridView(
        sectionIndex: 2,
        store: Store(
            initialState: CalendarGridReducer.State(filter: .all)) {
                CalendarGridReducer()._printChanges()
            })
}
