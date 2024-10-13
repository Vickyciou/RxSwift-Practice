//
//  ViewController.swift
//  RxSwift_Practice
//
//  Created by Vickyciou on 2024/10/13.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let textIsValid = textField.rx.text.orEmpty
            .map {$0.count >= 5 }
            .share(replay: 1)

        let textObserver = label.rx.isHidden

        textIsValid
            .bind(to: textObserver)
            .disposed(by: disposeBag)

    }


}

