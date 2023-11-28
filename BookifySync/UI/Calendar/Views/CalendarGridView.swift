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
    private let sections = Listing.examples
    
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
    
    private typealias ViewState = ViewStore<CalendarGridReducer.State, CalendarGridReducer.Action>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0..<7, id: \.self) { index in
                            let date = getDates()[index]
                            CalendarCell(day: date.formatDate("E"))
                        }
                    }
                }
                
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(getDates(), id: \.self) { date in
                        let event = getEvent(
                            dateIndex: date.toDay() - 1,
                            sectionIndex: sectionIndex
                        )
                        
                        HStack(spacing: 0) {
                            calendarCellBuilder(
                                date: date,
                                for: event,
                                viewStore: viewStore)
                        }
                    }
                }
                .clipped()
            }
        }
    }
    
    @ViewBuilder
    private func calendarCellBuilder(date: Date, for event: Event?, viewStore: ViewState) -> some View {
        let day = date.formatDate("d")
        if let event {
            CalendarCell(day: day)
                .pillView(
                    action: { viewStore.send(.booking(event)) },
                    name: event.title,
                    width: event.width - 25,
                    padding: 30
                )
        } else {
            CalendarCell(day: day)
        }
    }
    
    private func dateHasEvent(date: Date) -> Bool {
        events.filter {
            let startDate = $0.startDate.toDay()
            let endDate = $0.endDate.toDay()
            let day = date.toDay()
            
            if day > startDate && day <= endDate {
                return true
            }
            return false
        }.count == 0
    }

    func getDates() -> [Date] {
        var dates: [Date] = []
        var currentDate = startDate

        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        }

        return dates
    }
    
    private func getEvent(dateIndex: Int, sectionIndex: Int) -> Event? {
        events.filter {
            $0.listing.id == sections[sectionIndex - 1].id &&
            $0.startDate.formatDate("d") == getDates()[dateIndex].formatDate("d")
        }.first
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
