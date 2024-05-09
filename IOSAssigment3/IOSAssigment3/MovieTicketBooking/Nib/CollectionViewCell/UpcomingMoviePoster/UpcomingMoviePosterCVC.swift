//
//  CVCell_UpcomingMovie.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 28/4/2567 BE.
//

import UIKit

class UpcomingMoviePosterCVC: UICollectionViewCell {
  
  // MARK: - Outlets
  @IBOutlet weak private var imageIV: UIImageView!
  @IBOutlet weak private var titleLabel: UILabel!
  @IBOutlet weak private var screeningDatesLabel: UILabel!
  
  // MARK: - Functions
  func setupCell(_ movie: Movie) {
    imageIV.image = movie.imageName.loadImageString()
    titleLabel.text = movie.title
    
    // Format screening dates into a string
    let screeningDatesString = formatScreeningDates(movie.screeningDate)
    screeningDatesLabel.text = screeningDatesString
  }
  
  private func formatScreeningDates(_ screeningDates: [Date]) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd, yyyy"  // Customize the date format as needed
    let dateStringArray = screeningDates.map { formatter.string(from: $0) }
    let datesString = dateStringArray.joined(separator: ", ")
    return "\(datesString)"
  }
  
}

