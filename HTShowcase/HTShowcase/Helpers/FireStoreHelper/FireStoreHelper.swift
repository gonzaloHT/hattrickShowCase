//
//  FireStoreHelper.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/28/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import Firebase
import RxSwift

class FireStoreHelper {
    
    typealias FIRGetDocumentsResult = (QuerySnapshot?, error: Error?)
    
    enum Entity: String {
        case app = "Apps"
    }
    
    static let sharedInstance = FireStoreHelper()
    
    let db = Firestore.firestore()

    func getEntities<T: Mappable>(forEntity entity: Entity) -> Observable<ResultCollection<T>> {
        return rx.getCollection(entity: entity).asObservable().map({ (querySnapshot, error) -> ResultCollection<T> in
            if let error = error {
                return ResultCollection.error(HTSError(message: error.localizedDescription))
            } else {
                let entitiesList: [T] = querySnapshot!.documents.flatMap { T.init(dictionary: $0.data()) }
                
                return ResultCollection.success(entitiesList)
            }
        })
    }
    
}
