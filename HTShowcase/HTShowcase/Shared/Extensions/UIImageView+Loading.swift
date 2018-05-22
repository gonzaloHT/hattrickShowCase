//
//  UIImageView+Loading.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(withStringURL stringURL: String?, placeholder: UIImage? = nil) {
        guard let stringURL = stringURL else {
            self.image = placeholder
            return
        }
        
        let url = URL(string: stringURL)
        self.kf.setImage(with: url, placeholder: placeholder)
    }
    
}
