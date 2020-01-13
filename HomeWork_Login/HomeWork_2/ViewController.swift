//
//  ViewController.swift
//  HomeWork_2
//
//  Created by Sasza Niehaj on 12/17/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - ViewController
class ViewController: UIViewController {
    
    //MARK: - outlets
    @IBOutlet weak var segmentedSwitch: UISegmentedControl!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signUpView: UIView!
    
    //MARK: - enums
    enum Auth: Int {
        case login = 0
        case signIn = 1
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.isHidden = true
    }
    
    //MARK: - actions
    @IBAction func switchSelected(_ sender: Any) {
        selectPresentableView()
    }
    
    //MARK: - methods
    func selectPresentableView() {
        guard let option = Auth(rawValue: segmentedSwitch.selectedSegmentIndex) else { return }
        
        switch option {
        case .login:
            loginView.isHidden = false
            signUpView.isHidden = true
            print("Hello from Login")
        case .signIn:
            loginView.isHidden = true
            signUpView.isHidden = false
            print("Hello from Sign Up")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    
}

//MARK: - UIViewControllerExtension
extension UIViewController {
    
    func hideKeyboard() {
        view.endEditing(true)
    }
}
