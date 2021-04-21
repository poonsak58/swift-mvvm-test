//
//  MainViewControllerViewModel.swift
//  swift_mvvm_test
//
//  Created by Poonsak Aphidetmongkhon on 21/4/2564 BE.
//

import Foundation

class MainViewModel: MainInterface, MainInteractorOutput {
    
    var input: MainInteractorInput { return self }
    var output: MainInteractorOutput { return self }
    
    // MARK - Data-binding OutPut
    var showMessageAlert: ((String) -> Void)?
    var didError: (() -> Void)?
    
}

// MARK - Data-binding InPut
extension MainViewModel: MainInteractorInput {
    func saveMessageData(message: String?) {
        guard let msg = message,
            !msg.isEmpty,
             msg != "" else {
            didError?()
            return
        }
        showMessageAlert?(msg)
    }
}
