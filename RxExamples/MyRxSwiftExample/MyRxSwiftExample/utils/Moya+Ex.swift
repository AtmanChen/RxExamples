//
//  Moya+Ex.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation


/*
 extension MoyaProvider {
 
 func requestData(_ target: Target) -> Observable<APIResult> {
 
 return Observable.create { [weak self] observer in
 let cancellableToken = self?.request(target) { result in
 switch result {
 case .success(let value):
 observer.onNext(value.toResult())
 observer.onCompleted()
 case .failure(let error):
 logInfo("请求出错：\(error)\n")
 observer.onError(ResultError.error(type: .networkError))
 }
 }
 return Disposables.create {
 cancellableToken?.cancel()
 }
 }
 }
 
 // ---
 public class func JSONEndpointMapping(_ target: Target) -> Endpoint {
 
 let url = target.baseURL.appendingPathComponent(target.path).absoluteString
 return Endpoint(
 url: url,
 sampleResponseClosure: {
 .networkResponse(200, target.sampleData)
 },
 method: target.method,
 task: target.task,
 httpHeaderFields: target.headers
 )
 }
 }
 */

extension MoyaProvider {
    
    func requestData(_ target: Target) -> Observable<RequestResult> {
        
        return Observable.create { [weak self] observer in
            let cancellableToken = self?.request(target) { result in
                switch result {
                case .success(let value):
                    observer.onNext(value.toResult())
                    observer.onCompleted()
                case .failure:
                    observer.onError(ResultError.error(type: .networkError))
                }
            }
            return Disposables.create {
                cancellableToken?.cancel()
            }
        }
    }
    
    
    public class func JSONEndpointMapping(_ target: Target) -> Endpoint {
        
        let url = target.baseURL.appendingPathComponent(target.path).absoluteString
        return Endpoint(
            url: url,
            sampleResponseClosure: {
                .networkResponse(200, target.sampleData)
        },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
        )
    }
    
}

