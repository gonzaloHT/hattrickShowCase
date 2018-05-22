//
//  ShowcaseViewModel.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import RxSwift

class ShowcaseViewModel {
    
    let disposeBag = DisposeBag()
    
    //MARK: - Outputs
    
    var apps: Observable<[App]>
    
    init() {
        apps = ContentRepository.sharedInstance.getApps()
    }
    
}
