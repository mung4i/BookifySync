//
//  Action.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

typealias Action = () -> Void

func generateActions(count: Int) -> [Action] {
    var actions: [Action] = []
    for _ in 0..<count {
        actions.append({})
    }
    return actions
}
