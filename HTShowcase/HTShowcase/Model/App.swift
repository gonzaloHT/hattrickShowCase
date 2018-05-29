//
//  App.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/21/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import UIKit

class App : Mappable {
    
    let name: String
    let description: String
    let imageURL: String
    
    required init?(dictionary: Dictionary<String, Any>) {
        guard let name = dictionary["name"] as? String, let description = dictionary["description"] as? String, let imageURL = dictionary["imageURL"] as? String else {
            return nil 
        }
        
        self.name = name
        self.description = description
        self.imageURL = imageURL
        
        super.init(dictionary: dictionary)
    }
    
}
