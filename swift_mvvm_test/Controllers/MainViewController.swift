//
//  MainViewController.swift
//  swift_mvvm_test
//
//  Created by Poonsak Aphidetmongkhon on 21/4/2564 BE.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    var viewModel: MainInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(MainViewModel())
    }
    
    func configure(_ interface: MainInterface) {
        self.viewModel = interface
        bindToViewModel()
    }
    
    fileprivate func showAlert(msg: String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "ตกลง", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK - Event
    @IBAction func submitAction(_ sender: UIButton) {
        viewModel.input.saveMessageData(message: inputTextField.text)
    }

}

//MARK: - Binding
extension MainViewController {
    
    func bindToViewModel() {
        viewModel.output.showMessageAlert = showAlert()
        viewModel.output.didError = didError()
    }
    
    func didError() -> (() -> Void) {
        return { [weak self] in
            
            guard let weakSelf = self else { return }
            weakSelf.showAlert(msg: "error")
        }
    }
    
    func showAlert() -> ((String) -> Void) {
        return {  [weak self] message in

            guard let weakSelf = self else { return }
            weakSelf.showAlert(msg: message)
            
        }
    }
}
