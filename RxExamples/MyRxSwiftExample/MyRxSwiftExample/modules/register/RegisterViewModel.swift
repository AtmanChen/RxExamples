//
//  RegisterViewModel.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/27.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation
import Validator


struct ValidatorError: ValidationError {
    
    public let message: String
    public init(_ message: String) {
        self.message = message
    }
    
}

enum RegisterViewState {
    case input(Bool)
    case validating
    case validated(Bool)
    case empty
}

final class RegisterViewModel: ViewModelType {
    
    let input: Input
    let output: Output
    
    struct Input {
        let email: AnyObserver<String>
        let password: AnyObserver<String>
        let validate: AnyObserver<Void>
    }
    
    struct Output {
        let registerEnabled: Driver<Bool>
        let isLoading: Driver<Bool>
        let registerResult: Driver<String>
    }
    
    private let emailSubject = ReplaySubject<String>.create(bufferSize: 1)
    private let passwordSubject = ReplaySubject<String>.create(bufferSize: 1)
    private let validateSubject = PublishSubject<Void>()
    
    init() {
        let inputSource = ReplaySubject.combineLatest(emailSubject.distinctUntilChanged(), passwordSubject.distinctUntilChanged())
        let registerEnabled =
            inputSource
            .map { arg -> Bool in
                let (email, password) = arg
                return email.contains("@") && password.count >= 6
            }
            .startWith(false)
        
        let hideLoading = Observable<Bool>.just(false)
        
        let validating = validateSubject.withLatestFrom(inputSource)
            .map { _ -> Bool in
                return true
            }
        let isLoading = validating
            .concat(hideLoading.delay(2, scheduler: MainScheduler.instance))

        let validateResult = Observable<[Bool]>.just([true, false])
            .map { $0.randomElement()! }
            .map { $0 ? "GOOD" : "BAD" }
            .startWith("")
        
        output = Output(registerEnabled: registerEnabled.asDriver(onErrorJustReturn: false), isLoading: isLoading.asDriver(onErrorJustReturn: false), registerResult: validateResult.asDriver(onErrorJustReturn: ""))
        
        input = Input(email: emailSubject.asObserver(), password: passwordSubject.asObserver(), validate: validateSubject.asObserver())
    }
    
}
