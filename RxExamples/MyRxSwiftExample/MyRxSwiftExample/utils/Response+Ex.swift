//
//  Response+Ex.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation


extension Response {
    
    func toResult() -> RequestResult {
        guard let object = try? JSONDecoder().decode(RequestResult.self, from: self.data) else {
            return RequestResult.parseError()
        }
        return object
    }
    
}
