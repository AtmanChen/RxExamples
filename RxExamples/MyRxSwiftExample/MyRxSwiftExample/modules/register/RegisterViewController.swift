//
//  RegisterViewController.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/27.
//  Copyright © 2019 Buck. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var validateResultLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    private let viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.rx.text.orEmpty
            .bind(to: viewModel.input.email)
            .disposed(by: rx.disposeBag)
        
        passwordTF.rx.text.orEmpty
            .bind(to: viewModel.input.password)
            .disposed(by: rx.disposeBag)
        
        registerButton.rx.tap
            .bind(to: viewModel.input.validate)
            .disposed(by: rx.disposeBag)
        
        viewModel.output.registerEnabled
            .drive(registerButton.rx.isEnabled)
            .disposed(by: rx.disposeBag)
        
        viewModel.output.registerEnabled
            .map { enabled -> CGFloat in
                return enabled ? 1.0 : 0.4
            }
            .drive(registerButton.rx.alpha)
            .disposed(by: rx.disposeBag)
        
        viewModel.output.isLoading
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: rx.disposeBag)
        
        viewModel.output.registerResult
            .drive(validateResultLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
    }

}
