//
//  HTSError.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/29/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation

class HTSError: NSError {
    
    enum ErrorType: String {
        case appsNotFound = "Apps not found"
        case noType = "No type"
    }
    
    static let errorDomain = "com.hattrick.HTShowcase"
    static let defaultErrorMessage = "Something went wrong"
    static let defaultErrorCode = -1
    
    var errorType: ErrorType
    
    convenience init() {
        self.init()
        errorType = .noType
    }
    
    convenience init(type: ErrorType) {
        self.init()
        errorType = type
    }
    
    init(code: Int? = nil, message: String? ) {
        let errorMessage = message ?? HTSError.defaultErrorMessage
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        let errorCode = code ?? HTSError.defaultErrorCode
        errorType = .appsNotFound
        super.init(domain: HTSError.errorDomain, code: errorCode, userInfo: userInfo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
