//
//  MyTicketTableViewCell.swift
//  MovieTicketBooking
//
// Created by Natthapat Liawpairoj on 6/5/2567 BE.
//

import UIKit

class MyTicketTableViewCell: UITableViewCell {
  
  @IBOutlet weak var movieImageView: UIImageView!
  @IBOutlet weak var movieNameLabel: UILabel!
  @IBOutlet weak var theatreNameLabel: UILabel!
  @IBOutlet weak var showTimeLabel: UILabel!
  @IBOutlet weak var theatreNumberLabel: UILabel!
  @IBOutlet weak var seatNumberLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func updateData(with ticket: Ticket) {
    movieImageView.image = ticket.movie.imageName.loadImageString()
    movieNameLabel.text = ticket.movie.title
    showTimeLabel.text = "\(ticket.session.month)-\(ticket.session.day) \(ticket.session.time)"
    seatNumberLabel.text = ticket.seatCodes()
  }
}
