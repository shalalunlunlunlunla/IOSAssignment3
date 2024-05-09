//
//  Seat.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 28/4/2567 BE.
//

import Foundation

struct Seat: Codable {
    var section: Int
    var row: Int
    var selected: Bool
    var sold: Bool
    var seatCode: String { get { "\(["A", "B", "C", "D", "E", "F", "G", "H"][section])\(row + 1)" } }
    
    func isIdentical(_ otherSeat: Seat) -> Bool { seatCode == otherSeat.seatCode }

    init(_ section: Int, _ row: Int, selected: Bool = false, sold: Bool = false) {
        self.section = section
        self.row = row
        self.selected = selected
        self.sold = sold
    }
}
