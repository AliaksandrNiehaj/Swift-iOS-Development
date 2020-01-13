//
//  ViewController.swift
//  HomeWork_1
//
//  Created by Sasza Niehaj on 12/12/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - ViewControllerClass
class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.placeholder = "email"
        passwordTextField.placeholder = "password"
        
        emailTextField.becomeFirstResponder()
    }
    
    //MARK: - Actions
    @IBAction func loginButtonPressed(_ sender: Any) {
        print("User did tap login button!")
    }
    
    //MARK: - Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    
}

//MARK: - ViewControllerExtensionWithDelegateProtocol
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            hideKeyboard()
        }
        return true
    }
    
}

//MARK: - ViewControllerExtension
extension ViewController {
    
    func hideKeyboard() {
        view.endEditing(true)
    }
}
