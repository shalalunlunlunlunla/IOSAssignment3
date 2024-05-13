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
    
    func setupCell(with movie: Movie) {
        imageIV.image = movie.imageName.loadImageString()
        titleLabel.text = movie.title
        setScreeningDates(movie)
    }
    
    func setupCell(with banner: Banner) {
        imageIV.image = UIImage(named: banner.image)
        titleLabel.text = banner.title
    }
    
    private func setScreeningDates(_ movie: Movie) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"  // Customize the date format as needed
        
        let screeningDateString = movie.screeningDate.map { formatter.string(from: $0) }.joined(separator: ", ")
        screeningDatesLabel.text = "\(screeningDateString)"
    }
}
