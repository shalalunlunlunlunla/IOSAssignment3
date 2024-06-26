//
//  CVCell_Movie2.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 27/4/2567 BE.
//

import UIKit

class MovieCVC: UICollectionViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak private var imageIV: UIImageView!
  @IBOutlet weak private var titleLabel: UILabel!
  @IBOutlet weak private var screeningDatesLabel: UILabel!
  
  // MARK: - Functions
  
  func setupCell(_ movie: Movie) {
    imageIV.image = movie.imageName.loadImageString()
    titleLabel.text = movie.title
    setScreeningDates(movie)
  }
  
  // Function to set screening dates
  private func setScreeningDates(_ movie: Movie) {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd, yyyy"  // Customize the date format as needed
    
    let screeningDatesString = movie.screeningDate.map { formatter.string(from: $0) }.joined(separator: ", ")
    screeningDatesLabel.text = "\(screeningDatesString)"
  }
}

