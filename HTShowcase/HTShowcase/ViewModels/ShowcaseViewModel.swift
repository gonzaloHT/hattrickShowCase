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
    
    var apps: Observable<[App]>!
    
    var error: Observable<String> {
        return _error.asObservable()
    }
    
    //MARK: - Properties

    private let _error = PublishSubject<String>()
    
    init() {
        apps = ContentRepository.sharedInstance.getApps().flatMap { _ -> Observable<ResultCollection<App>> in
            return ContentRepository.sharedInstance.getApps()
            }.map({ [weak self] resultCollection -> [App] in
                switch resultCollection {
                case .success(let apps):
                    return apps
                case .error(let err):
                    self?._error.asObserver().onNext(err.localizedDescription)
                    return []
                }
            })
    }
    
}
