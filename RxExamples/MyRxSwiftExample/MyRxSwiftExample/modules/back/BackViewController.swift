//
//  BackViewController.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/27.
//  Copyright © 2019 Buck. All rights reserved.
//

import UIKit

final class BackViewController: BaseViewController {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backButton.hero.id = "backID"
        backButton.rx.tap
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                self?.navigationController?.popViewController()
            })
            .disposed(by: rx.disposeBag)
    }

}
