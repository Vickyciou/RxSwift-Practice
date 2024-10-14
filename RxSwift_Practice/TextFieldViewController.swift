//
//  TextFieldViewController.swift
//  RxSwift_Practice
//
//  Created by Vickyciou on 2024/10/13.
//

import UIKit
import RxSwift
import RxCocoa

class TextFieldViewController: UIViewController {
    @IBOutlet weak private var userNameTextField: UITextField!
    @IBOutlet weak private var userNameValidlabel: UILabel!
    @IBOutlet weak private var passWordTextField: UITextField!
    @IBOutlet weak private var passWordValidLabel: UILabel!
    private let viewModel = TextFieldViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    private func binding() {
        userNameTextField.rx.text.orEmpty
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
        
        passWordTextField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
        
        viewModel.isUsernameValid
            .bind(to: userNameValidlabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.isPasswordValid
            .bind(to: passWordValidLabel.rx.isHidden)
            .disposed(by: disposeBag)
    }


}

