//
//  JobAPIManager.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation

let jobProvider = MoyaProvider<JobAPIManager>(endpointClosure: MoyaProvider.JSONEndpointMapping,
                                              plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: BaseAPIManager.jsonResponseDataFormatter),BaseAPIManager.networkActivityPlugin])

enum JobAPIManager {
    case jobs(page: Int)
}

extension JobAPIManager: TargetType {
    
    var baseURL: URL {
        return BaseAPIManager.BaseURL
    }
    
    var path: String {
        switch self {
        case .jobs:
            return "enJob/list"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var parameters: [String: String] = [:]
        switch self {
        case let .jobs(page):
            parameters["page"] =  page.string
        }
        parameters += BaseAPIManager.baseParameters
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return BaseAPIManager.headers
    }
    
    
}
