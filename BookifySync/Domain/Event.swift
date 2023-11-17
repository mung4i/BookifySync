//
//  Event.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
}
