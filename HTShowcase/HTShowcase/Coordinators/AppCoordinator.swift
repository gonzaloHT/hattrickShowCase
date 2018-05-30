//
//  AppCoordinator.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class AppCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        showShowcase()
        return Observable.never()
    }
    
    func showShowcase() {
        let showcaseCoordinator = ShowcaseCoordinator(window: window)
        _ = coordinate(to: showcaseCoordinator)
    }
    
}
