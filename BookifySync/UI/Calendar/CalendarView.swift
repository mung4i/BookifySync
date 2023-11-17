//
//  CalendarView.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import Foundation
import SwiftUI

struct CalendarView: View {
    
    let listings: [Listing]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            HeaderView(action: {})
                .padding(.top, 32)
            
            DropDownView(listings: listings)
                .frame(width: 280)            
            
            Spacer()
        }
    }
}

#Preview {
    
    let listings: [Listing] = [
        Listing(name: "Seaside Cottage"),
        Listing(name: "Mali Apartments"),
        Listing(name: "Lui Homes"),
        Listing(name: "City View"),
        Listing(name: "Zuri Homes"),
    ]
    
    return CalendarView(
        listings: listings
    )
}
