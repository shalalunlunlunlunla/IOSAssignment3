//
//  Extension+CollectionView.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 7/5/2567 BE.
//

import Foundation
import UIKit

extension UICollectionView {
    func setup(_ nibName: String, _ flowLayout: UICollectionViewFlowLayout) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        self.collectionViewLayout = flowLayout
    }
}
