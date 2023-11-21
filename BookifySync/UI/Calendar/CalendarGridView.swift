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
    
    private let calendar = Calendar.current
    private let currentDate = Date()
    private let events = Event.examples
    private let sections = Listing.examples
    
    private let days: [String] = [
        "SAT",
        "SUN",
        "MON",
        "TUE",
        "WED",
        "THU",
        "FRI"
    ]
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0..<7, id: \.self) { index in
                            CalendarCell(day: days[index])
                        }
                    }
                    
                    LazyVGrid(
                        columns: Array(
                            repeating: GridItem(.fixed(50), spacing: 0),
                            count: 7),
                        spacing: 0) {
                            ForEach(daysInMonth(), id: \.self) { day in
                                CalendarCell(day: day.formatDate("d"))
                                    .overlay {
                                        let index = Int(day.formatDate("d")) ?? 1
                                        let event = getEvent(
                                            dateIndex: index,
                                            sectionIndex: sectionIndex
                                        )
                                        PillView(
                                            action: { viewStore.send(.booking(event)) },
                                            name: event?.title ?? "",
                                            width: event?.width ?? 100
                                        )
                                        .opacity(event == nil ? 0 : 1)
                                        .padding(.leading, 50)
                                        .zIndex(10)
                                    }
                            }
                        }
                }
            }
        }
    }
    
    
    private func daysInMonth() -> [Date] {
        guard let monthRange = calendar.range(of: .day, in: .month, for: currentDate) else {
            return []
        }
        
        return monthRange.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth())
        }
    }
    
    private func getEvent(dateIndex: Int, sectionIndex: Int) -> Event? {
        events.filter {
            $0.listing.id == sections[sectionIndex - 1].id &&
            $0.startDate.formatDate() == getDateRange()[dateIndex].formatDate()
        }.first
    }
    
    private func getDateRange() -> [Date] {
        var currentDate = Date()
        var dates: [Date] = []
        var endDate = Date.advanceDate(component: .year)
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = Date.advanceDate(date: currentDate)
        }
        
        return dates
    }
    
    // Function to get the first day of the month
    private func firstDayOfMonth() -> Date {
        guard let firstDay = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) else {
            return currentDate
        }
        
        return firstDay
    }
}

#Preview {
    CalendarGridView(
        sectionIndex: 1,
        store: Store(
            initialState: CalendarGridReducer.State(filter: .all)) {
                CalendarGridReducer()._printChanges()
            })
}
