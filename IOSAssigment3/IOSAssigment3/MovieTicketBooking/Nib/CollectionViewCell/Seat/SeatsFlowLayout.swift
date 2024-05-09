//
//  CVFlowLayout_Seats.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 30/4/2567 BE.
//

import UIKit

class SeatsFlowLayout: UICollectionViewFlowLayout {
    init(minimumInteritemSpacing: Double = 5, minimumLineSpacing: Double = 5) {
        super.init()
        self.minimumLineSpacing = minimumLineSpacing
        self.minimumInteritemSpacing = minimumInteritemSpacing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        var allAttributes: [UICollectionViewLayoutAttributes] = []
        for section in 0..<collectionView.numberOfSections {
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
                if let attributes = layoutAttributesForItem(at: indexPath) {
                    allAttributes.append(attributes)
                }
            }
        }
        return allAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }
        let attributes = super.layoutAttributesForItem(at: indexPath)?.copy() as!UICollectionViewLayoutAttributes
        let sectionItemCount = collectionView.numberOfItems(inSection: indexPath.section)
        let totalItemWidth = CGFloat(sectionItemCount) * itemSize.width
        let totalSpacingWidth = CGFloat(sectionItemCount - 1) * minimumInteritemSpacing + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
        let xOffset = (collectionView.bounds.width - totalItemWidth - totalSpacingWidth) / 2.0
        let sectionNumber = CGFloat(indexPath.section)
        attributes.frame.origin.x += xOffset
        attributes.frame.origin.y += minimumLineSpacing * sectionNumber
        return attributes
    }
    
    //Number of seats
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let sections = collectionView.numberOfSections
        let itemsPerRow = collectionView.numberOfItems(inSection: 0)
        let spacings = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(itemsPerRow - 1)
        let itemWidth = (collectionView.bounds.width - spacings) / CGFloat(itemsPerRow)
        var itemHeight = itemWidth
        if itemHeight * CGFloat(itemsPerRow) + minimumLineSpacing * CGFloat(sections - 1) > collectionView.bounds.height {
            itemHeight = (collectionView.bounds.height - minimumLineSpacing * CGFloat(sections - 1)) / CGFloat(itemsPerRow)
        }
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }

}
