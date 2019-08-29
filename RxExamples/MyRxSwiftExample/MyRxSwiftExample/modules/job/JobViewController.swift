//
//  JobViewController.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import UIKit

class JobViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(nib: JobTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
    }

}
