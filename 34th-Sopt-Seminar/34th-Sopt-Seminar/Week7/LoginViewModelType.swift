//
//  LoginViewModelType.swift
//  34th-Sopt-Seminar
//
//  Created by Chandrala on 5/25/24.
//

import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}
