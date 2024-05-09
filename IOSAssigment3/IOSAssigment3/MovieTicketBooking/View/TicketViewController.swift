//
//  VC_Ticket.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 30/4/2567 BE.
//

import UIKit

final class TicketViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak private var titleLabel: UILabel!
  @IBOutlet weak private var seatsLabel: UILabel!
  @IBOutlet weak private var dateLabel: UILabel!
  @IBOutlet weak private var timeLabel: UILabel!
  @IBOutlet weak private var priceLabel: UILabel!
  
  // MARK: - Variables
  
  var ticket: Ticket?
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fillTicket()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  // MARK: - Functions
  
  private func fillTicket() {
    guard let ticket = ticket else { return }
    titleLabel.text = ticket.movie.title
    seatsLabel.text = ticket.seatCodes()
    dateLabel.text = ticket.session.date.toString()
    timeLabel.text = ticket.session.time
    priceLabel.text = String(ticket.price)
    saveTicket(ticket: ticket)
  }
  
  private func saveTicket(ticket: Ticket) {
    let userDefault = UserDefaults.standard
    if let savedTicketData = userDefault.data(forKey: "savedTicket"),
       var savedTicket = try? JSONDecoder().decode([Ticket].self, from: savedTicketData) {
      savedTicket.append(ticket)
      if let savedTicketEnCoded = try? JSONEncoder().encode(savedTicket) {
        userDefault.set(savedTicketEnCoded, forKey: "savedTicket")
      }
    } else if let ticketEncoded = try? JSONEncoder().encode([ticket]) {
      userDefault.set(ticketEncoded, forKey: "savedTicket")
    }
  }
  
  // MARK: - Outlets
  
  @IBAction private func btnGoHome_TUI(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
  }
}
