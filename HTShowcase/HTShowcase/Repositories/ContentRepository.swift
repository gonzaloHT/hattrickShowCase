//
//  ContentRepository.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Firebase

enum ResultCollection<T> {
    case success([T])
    case error(HTSError)
}

class ContentRepository {
    
    static let sharedInstance = ContentRepository()

    func getApps() -> Observable<ResultCollection<App>> {
        return FireStoreHelper.sharedInstance.getEntities(forEntity: .app)
    }
    
}
