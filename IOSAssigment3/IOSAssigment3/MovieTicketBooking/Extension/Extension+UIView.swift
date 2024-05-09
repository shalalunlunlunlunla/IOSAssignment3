//
//  Extension+UIView.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 6/5/2567 BE.
//

import Foundation
import UIKit

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self).first as? UIView
    }
}
