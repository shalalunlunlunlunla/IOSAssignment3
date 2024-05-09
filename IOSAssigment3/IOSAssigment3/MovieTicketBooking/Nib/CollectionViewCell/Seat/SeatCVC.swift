//
//  CVCell_Seat.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 30/4/2567 BE.
//

import UIKit

class SeatCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var imageIV: UIImageView!
    
    //Setup seat images
    func setupCell(_ seat: Seat) {
        let imageNameAvailable = "seatAvaliable"
        let imageNameSelected = "seatSelected"
        let imageNameReserve = "seatReserve"
        
        //Image conditions
        let imageName = seat.sold ? imageNameReserve : (seat.selected ? imageNameSelected : imageNameAvailable)

        imageIV.image = UIImage(named: imageName)
    }
}
