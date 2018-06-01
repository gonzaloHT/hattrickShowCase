//
//  HTSNavigationController.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import UIKit

class HTSNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
    }
    
    private func setStyle() {
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white , NSAttributedStringKey.font: Style.Fonts.Raleway.semiBoldFontOfSize(ofSize: 20)]
        navigationBar.backgroundColor = Style.Colors.mainBlueColor()
        navigationBar.isTranslucent = false;
        navigationBar.barTintColor = Style.Colors.mainBlueColor()
        view.backgroundColor = Style.Colors.mainBlueColor()
        navigationBar.tintColor = UIColor.white
    }
    
}
