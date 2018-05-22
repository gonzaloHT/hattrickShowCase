//
//  ShowcaseCollectionViewCell.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import UIKit

class ShowcaseCollectionViewCell: ShadowAndRoundedCollectionViewCell {
    
    static let cellReuseIdentifier = "ShowcaseCollectionViewCellIdentifier"
    static let cellNibName = "ShowcaseCollectionViewCell"
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
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
