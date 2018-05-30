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

class ContentRepository {
    
    static let sharedInstance = ContentRepository()
    
    func getApps() -> Observable<[App]> {
        
        let app1 = App(name: "Alto al Crimen", description: "Alto al crimen is an app that...", imageURL: "https://i.ytimg.com/vi/EDNwYMYTw7Y/maxresdefault.jpg")
        
        let app2 = App(name: "Run app", description: "Run app is an app that", imageURL: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fanthonykarcz%2Ffiles%2F2017%2F05%2FLumo-Run_Lifestyle_Park3.jpg")
        
        let app3 = App(name: "¿A qué hora juega?", description: "A que hora juega is an app that", imageURL: "https://im.ziffdavisinternational.com/ign_es/screenshot/f/fifa-soccer-14-ps3/fifa-soccer-14-ps3_yxmn.jpg")
        
        return Observable.just([app1,app2,app3,app1,app2, app3])
        
    }
}
