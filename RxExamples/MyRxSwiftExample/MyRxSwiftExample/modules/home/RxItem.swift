//
//  RxItem.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/27.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation


enum RxType {
    case tap
    case register
    case word
}

struct RxItem {
    let title: String
    let type: RxType
}
