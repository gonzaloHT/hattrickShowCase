//
//  AppDetailViewModel.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/31/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import RxSwift

class AppDetailViewModel {
    
    let disposedBag = DisposeBag()
    
    //MARK: - Outputs
    
    var app: Observable<App> {
        return _appVariable.asObservable()
    }
    
    //MARK: - Properties
    
    private let _appVariable: Variable<App>
    
    init(app: App) {
        self._appVariable = Variable<App>(app)
    }
}
