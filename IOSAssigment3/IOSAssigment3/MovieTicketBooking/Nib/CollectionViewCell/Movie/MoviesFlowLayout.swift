//
//  CVFlowLayout_AllMovies.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 28/4/2567 BE.
//

import UIKit

class MoviesFlowLayout: UICollectionViewFlowLayout {
    private var columnCount = 2
    private var heightRatio: CGFloat = 4 / 3
    private var bottomInfoHeight: CGFloat = 75 // Change to CGFloat
    
    init(minimumInteritemSpacing: CGFloat = 10, minimumLineSpacing: CGFloat = 20, bottomInfoHeight: CGFloat = 50) {
        super.init()
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.bottomInfoHeight = bottomInfoHeight
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let spacings = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(columnCount - 1)
        let itemWidth = (collectionView.bounds.width - spacings) / CGFloat(columnCount)
        let itemHeight = itemWidth * heightRatio + bottomInfoHeight
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
}
