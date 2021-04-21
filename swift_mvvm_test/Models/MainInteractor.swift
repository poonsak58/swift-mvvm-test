//
//  MainInteractor.swift
//  swift_mvvm_test
//
//  Created by Poonsak Aphidetmongkhon on 21/4/2564 BE.
//

import Foundation

// MARk - Data-binding
protocol MainInteractorInput {
    func saveMessageData(message: String?)
}

protocol MainInteractorOutput: class {
    var showMessageAlert: ((String) -> Void)? { get set }
    var didError: (() -> Void)? { get set }
}

protocol MainInterface: MainInteractorInput, MainInteractorOutput {
    var input: MainInteractorInput { get }
    var output: MainInteractorOutput { get }
}
