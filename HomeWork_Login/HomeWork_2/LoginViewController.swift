//
//  LoginViewController.swift
//  HomeWork_2
//
//  Created by Sasza Niehaj on 12/17/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - LoginViewController
class LoginViewController: BaseViewController {
    
    //MARK: - outlets
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    //MARK: - actions
    @IBAction func forgotPasswordButtonTapped() {
        print("Forgot button from Login did tapped")
        hideKeyboard()
    }
    
    //MARK: - methods
    override func authorizeUser() {
        print("Login button did tap")
        hideKeyboard()
    }
    
    override func askForHelp() {
        print("Help button from Login did tap")
    }
    
}
