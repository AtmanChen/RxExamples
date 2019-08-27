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
