//
//  ShowcaseHighImageCollectionViewCell.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/23/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import UIKit

class ShowcaseHighImageCollectionViewCell: ShadowAndRoundedCollectionViewCell {
    
    static let cellReuseIdentifier = "ShowcaseHighImageCollectionViewCellIdentifier"
    static let cellNibName = "ShowcaseHighImageCollectionViewCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
    }
    
    func setup(withApp app: App) {
        self.appImageView.setImage(withStringURL: app.imageURL)
        self.appNameLabel.text = app.name
        self.appImageView.layer.masksToBounds = true
        
        setupShadowAndRoundedCorner(containerView: containerView)
    }

}
