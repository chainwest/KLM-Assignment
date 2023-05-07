//
//  Int+toDateFormattedString.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/5/23.
//

import Foundation

extension Int {
    func toDateFormattedString() -> String {
        let timeInterval = TimeInterval(self)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: date)
    }
}
