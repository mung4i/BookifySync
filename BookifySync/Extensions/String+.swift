//
//  String+.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

extension String {
    func addNewLineAfterSpace() -> String {
        var resultString = ""

        for character in self {
            if character == " " {
                resultString += " \n"
            } else {
                resultString.append(character)
            }
        }

        return resultString
    }
}

extension String {
    func toInt() -> Int {
        Int(self) ?? 1
    }
}
