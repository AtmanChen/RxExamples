//
//  TableSectionItem.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/27.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation
import Differentiator


struct TableSectionItem<T> {
    var header: String
    var items: [T]
}

extension TableSectionItem: SectionModelType {
    
    typealias Item = T
    
    init(original: TableSectionItem, items: [T]) {
        self = original
        self.items = items
    }
    
    
}
