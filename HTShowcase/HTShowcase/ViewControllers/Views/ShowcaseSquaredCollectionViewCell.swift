//
//  ShowcaseSquaredCollectionViewCell.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/23/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import UIKit

class ShowcaseSquaredCollectionViewCell: ShadowAndRoundedCollectionViewCell {
    
    static let cellReuseIdentifier = "ShowcaseSquaredCollectionViewCellIdentifier"
    static let cellNibName = "ShowcaseSquaredCollectionViewCell"
    
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
