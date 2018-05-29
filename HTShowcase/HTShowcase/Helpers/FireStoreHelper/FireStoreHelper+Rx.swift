//
//  FireStoreHelper+Rx.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/29/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import RxSwift
import Firebase

extension FireStoreHelper: ReactiveCompatible {}

extension Reactive where Base: FireStoreHelper {
    
    func getCollection(entity: FireStoreHelper.Entity) -> Single<FireStoreHelper.FIRGetDocumentsResult> {
        return Single.create { [weak base] single in
            base?.db.collection(entity.rawValue).getDocuments() { (querySnapshot, err) in
                single(.success((querySnapshot, err)))
            }
            
            return Disposables.create()
        }
    }
    
}
