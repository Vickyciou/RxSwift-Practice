//
//  TextFieldViewModel.swift
//  RxSwift_Practice
//
//  Created by Vicky on 2024/10/14.
//

import Foundation
import RxSwift
import RxCocoa

class TextFieldViewModel {
    
    let username = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay(value: "")
    let isUsernameValid: Observable<Bool>
    let isPasswordValid: Observable<Bool>
    
    init() {
        isUsernameValid = username
            .map {$0.count >= 5 }
            .share(replay: 1)
        
        isPasswordValid = password
            .map { $0.count >= 8 }
            .share(replay: 1)
    }

}
