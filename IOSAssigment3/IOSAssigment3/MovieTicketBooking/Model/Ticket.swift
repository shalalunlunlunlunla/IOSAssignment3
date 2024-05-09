//
//  Ticket.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 4/5/2567 BE.
//

import Foundation

struct Ticket: Codable {
    static private var tickets: [Ticket] = []
    
    var movie: Movie
    var session: Session
    var seats: [Seat]
    var price: Double
    
    func seatCodes() -> String {
        seats.map { $0.seatCode }.joined(separator: ", ")
    }
    
    static func soldSeats(movie: Movie, session: Session) -> [Seat] {
        tickets
            .filter { ticket in
                ticket.movie.isIdentical(movie) && ticket.session.isIdentical(session)
            }
            .flatMap { $0.seats }
    }
    
    init(movie: Movie, session: Session, seats: [Seat], price: Double) {
        self.movie = movie
        self.session = session
        self.seats = seats
        self.price = price
        Ticket.tickets.append(self)
    }
}
