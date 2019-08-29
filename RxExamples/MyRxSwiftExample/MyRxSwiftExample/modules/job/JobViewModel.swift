//
//  JobViewModel.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation

enum LoadType {
    case head
    case more
}

final class JobViewModel {
    
//    let input: Input
//    let output: Output
//
//    struct Input {
//        let headerRefresh: AnyObserver<Void>
//        let footerRefresh: AnyObserver<Void>
//    }
//
//    struct Output {
//        let jobItems: BehaviorRelay<[JobItem]> = .init(value: [])
//    }
//
//    private var page = 1
//    private let headerRefreshSubject = ReplaySubject<LoadType>.create(bufferSize: 1)
//    private let footerRefreshSubject = ReplaySubject<LoadType>.create(bufferSize: 1)
//
//    init() {
//        input = Input(headerRefresh: headerRefreshSubject.asObserver(), footerRefresh: footerRefreshSubject.asObserver())
//        let jobItemsDriver = Observable.merge(headerSources, footerSources).asDriver(onErrorJustReturn: [])
//        output = Output(jobItems: jobItemsDriver)
//        let headerSources = headerRefreshSubject.flatMapLatest { [weak self] _ -> Driver<[JobItem]> in
//            guard let self = self else {
//                return .just([])
//            }
//            self.page = 1
//            return self.requestJobItems()
//                .asDriver(onErrorJustReturn: [])
//        }
//
//        let footerSources = footerRefreshSubject.flatMapLatest { [weak self] _ -> Driver<[JobItem]> in
//            guard let self = self else {
//                return .just([])
//            }
//            return self.requestJobItems()
//                .do(onNext: { _ in
//                    self.page += 1
//                })
//                .asDriver(onErrorJustReturn: [])
//        }
//
//        let r = ReplaySubject.merge(headerRefreshSubject, footerRefreshSubject)
//            .flatMapLatest { type -> Driver<[JobItem]> in
//                switch type {
//                case .head:
//                    self.page = 1
//                default: break
//                }
//                return self.requestJobItems()
//                    .do(onNext: { _ in
//                        if case LoadType.more = type {
//                            self.page += 1
//                        }
//                    })
//                    .asDriver(onErrorJustReturn: [])
//            }
//
//
//
//    }
    
}

extension JobViewModel {
//    func requestJobItems() -> Observable<[JobItem]> {
//        return jobProvider.requestData(.jobs(page: page))
//            .delay(2, scheduler: MainScheduler.instance)
//            .map { try $0.mapObjects(JobItem.self) }
//    }
}
