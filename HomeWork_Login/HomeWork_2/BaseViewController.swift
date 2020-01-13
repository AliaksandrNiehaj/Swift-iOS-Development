//
//  BaseViewController.swift
//  HomeWork_2
//
//  Created by Sasza Niehaj on 12/18/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - BaseViewController
class BaseViewController: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var authorizationButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: - actions
    @IBAction func authorizationButtonTapped() {
        authorizeUser()
    }
    
    @IBAction func helpButtonPressed(_ sender: Any) {
        askForHelp()
    }
    
    //MARK: - methods
    func authorizeUser() {
        // it have to be overriden in childClass
    }
    
    func askForHelp() {
        // it have to be overriden in childClass
    }

}

//MARK: - BaseViewControllerExtension
extension BaseViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            hideKeyboard()
        }
        return true
    }
}
