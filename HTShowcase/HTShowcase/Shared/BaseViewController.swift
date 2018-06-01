//
//  BaseViewController.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/31/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackBarButton()
    }
    
    func setupBackBarButton() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
}
