//
//  Extension+String.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 4/5/2567 BE.
//

import Foundation

extension String {
    func toDate()->Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: self)!
    }
}
