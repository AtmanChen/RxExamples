//
//  BaseAPIManager.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation


struct BaseAPIManager {
    
    
    static let BaseURL: URL = {
        #if DEBUG
        return try! "http://api.jinxiansen.com/".asURL()
        #else
        return try! "http://api.jinxiansen.com/".asURL()
        #endif
    }()
    
    static let headers: [String : String] = {
        return ["Content-type":"application/x-www-form-urlencoded; charset=utf-8"]
    }()
    
    static let networkActivityPlugin = NetworkActivityPlugin { (change,_)  -> () in
        switch(change){
        case .ended:
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        case .began:
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            }
        }
    }
    
}

extension BaseAPIManager {
    
    static func jsonResponseDataFormatter(_ data: Data) -> Data {
        do {
            let json = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            return prettyData
        } catch {
            return data //fallback to original data if it cant be serialized
        }
    }
    
    static let baseParameters: [String:String] = {
        var parameters: [String: String] = [:]
        parameters["device"] = "iOS"
        parameters["udid"] = UUID().uuidString
        return parameters
    }()
}
