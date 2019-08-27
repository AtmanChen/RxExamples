//
//  TapViewController.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/27.
//  Copyright © 2019 Buck. All rights reserved.
//

import UIKit
import Hero
import RxCocoa
import RxSwift

final class TapViewController: BaseViewController {

    @IBOutlet weak var tapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tapButton.hero.id = "backID"
        
        tapButton.rx.tap
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                self?.navigationController?.pushViewController(UIStoryboard.load(controller: BackViewController.self))
            })
            .disposed(by: rx.disposeBag)
    }

}
