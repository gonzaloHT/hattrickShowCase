//
//  ShowcaseCoordinator.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ShowcaseCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let viewModel = ShowcaseViewModel()
        let viewController = ShowcaseViewController(viewModel: viewModel)
        let navigationController = HTSNavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        viewModel.didSelectApp.do(onNext: {(app) -> Void in
            let appDetailViewModel = AppDetailViewModel(app: app)
            let appDetailViewController = AppDetailViewController(viewModel: appDetailViewModel)
            navigationController.pushViewController(appDetailViewController, animated: true)
        }).subscribe()
            .disposed(by: disposeBag)
        
        return Observable.never()
    }
    
}
