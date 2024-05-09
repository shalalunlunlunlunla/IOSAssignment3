//
//  Extension+Int.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 4/5/2567 BE.
//

import Foundation

extension Int {
    func formatSingleDigitNumber() -> String {
        self < 10 ? "0\(self)" : "\(self)"
    }
}
