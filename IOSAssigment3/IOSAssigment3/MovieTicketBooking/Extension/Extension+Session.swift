//
//  Extension+Session.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 4/5/2567 BE.
//

import Foundation

extension Session {
    func toString() -> String {
        return "\(self.day) \(self.month) - \(self.time)"
    }
}
