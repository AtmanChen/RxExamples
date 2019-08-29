//
//  RequestResult.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation

struct RequestResult: Decodable {
    
    let status: Int
    let message: String
    let data: Data?
    
    static func netError() -> RequestResult {
        return RequestResult(status: -1, message: ErrorType.networkError.rawValue, data: nil)
    }
    
    static func parseError() -> RequestResult {
        return RequestResult(status: -2, message: ErrorType.dataParseError.rawValue, data: nil)
    }
    
    var isOK: Bool {
        return status == 0
    }
}

extension RequestResult {
    func mapObjects<T: Decodable>(_ map: T.Type) throws -> [T] {
        guard isOK else {
            throw ResultError.parseError(self.message)
        }
        guard let data = self.data,
                let objects = try? JSONDecoder().decode([T].self, from: data) else {
            throw ResultError.parseError(ErrorType.dataParseError.rawValue)
        }
        return objects
    }
}


