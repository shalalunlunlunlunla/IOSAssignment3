//
//  MoviePosterCVC.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 1/5/2567 BE.
//

import UIKit

class MoviePosterCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak private var imageIV: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var screeningDatesLabel: UILabel!
    
    
    // MARK: - Functions
    func setupCell(_ movie: Movie) {
        imageIV.image = movie.imageName.loadImageString()
        titleLabel.text = movie.title
        setScreeningDates(movie.title, movie.screeningDate) // Call the new function to set screening dates
    }
    
    // New function to set screening dates
    func setScreeningDates(_ title: String, _ screeningDates: [Date]) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"  // Customize the date format as needed
        
        let screeningDatesString = screeningDates.map { formatter.string(from: $0) }.joined(separator: ", ")
        screeningDatesLabel.text = "\(screeningDatesString)"
    }
}

