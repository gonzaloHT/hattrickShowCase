//
//  ShadowAndRoundedCollectionViewCell.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/30/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import UIKit

class ShadowAndRoundedCollectionViewCell: UICollectionViewCell {
    
    func setupShadowAndRoundedCorner(containerView: UIView) {
        containerView.layer.cornerRadius = 7
        let shadowPath = UIBezierPath(rect: self.bounds)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: CGFloat(4.0), height: CGFloat(4.0))
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 7
        self.layer.shadowPath = shadowPath.cgPath
    }

}
