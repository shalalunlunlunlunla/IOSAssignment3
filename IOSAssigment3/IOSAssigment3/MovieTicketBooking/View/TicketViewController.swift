//
//  VC_Ticket.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 30/4/2567 BE.
//

import UIKit

final class TicketViewController: UIViewController {
  
  // MARK: - Outlets
  
    @IBOutlet weak var congratsView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
  @IBOutlet weak private var seatsLabel: UILabel!
  @IBOutlet weak private var dateLabel: UILabel!
  @IBOutlet weak private var timeLabel: UILabel!
  @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak var goHomeButton: UIButton!
    
  // MARK: - Variables
    
    var isOnlyShowDetailTicket: Bool = false
  
  var ticket: Ticket?
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fillTicket()
      self.setUI()
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
      if !self.isOnlyShowDetailTicket{
          saveTicket(ticket: ticket)
      }
  }
    
    func setUI(){
        if isOnlyShowDetailTicket{
            self.goHomeButton.setTitle("GO BACK", for: .normal)
        }
        self.congratsView.isHidden = isOnlyShowDetailTicket
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
      if isOnlyShowDetailTicket{
          self.navigationController?.popViewController(animated: true)
      }else{
          navigationController?.popToRootViewController(animated: true)
      }
  }
}
