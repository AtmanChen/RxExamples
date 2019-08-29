//
//  JobItem.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import Foundation

/*
 var company : String?
 var exp : String?
 var id : Int?
 var jobId : String?
 var loc : String?
 var more : String?
 var publisher : String?
 var salary : String?
 var title : String?
 */

struct JobItem: Decodable {
    
    let company: String
    let exp: String
    let id: Int
    let jobId: String
    let loc: String
    let more: String
    let publisher: String
    let salary: String
    let title: String
    
    init(company: String, exp: String, id: Int, jobId: String, loc: String, more: String, publisher: String, salary: String, title: String) {
        self.company = company
        self.exp = exp
        self.id = id
        self.jobId = jobId
        self.loc = loc
        self.more = more
        self.publisher = publisher
        self.salary = salary
        self.title = title
    }
}
