//
//  SignUpViewController.swift
//  HomeWork_2
//
//  Created by Sasza Niehaj on 12/17/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - SignUpViewController
class SignUpViewController: BaseViewController {
    
    //MARK: - outlets
    @IBOutlet weak var buyerCharacteristicSwitch: UISwitch!
    @IBOutlet weak var userAgreementButton: UIButton!
    
    //MARK: - instanceTypes
    enum Buyer: Int {
        case privatePerson = 0
        case privateEntrepreneurOrCompany = 1
    }
    
    //MARK: - properies
    var buyer: Buyer!
    
    //MARK: - actions
    @IBAction func buyerCharacteristicSwitchSelected(_ sender: Any) {
        if buyerCharacteristicSwitch.isOn {
            buyer = .privateEntrepreneurOrCompany
            print("Private Entreneur or Company from Sign Up have selected")
        } else {
            buyer = .privatePerson
            print("Private Person from Sign Up has selected")
        }
    }
    
    @IBAction func userAgreementButtonPressed(_ sender: Any) {
        print("User Agreement button did tap")
        // to add implementation
    }
    
    //MARK: - methods
    override func authorizeUser() {
        print("Sign Up button from Sign Up pressed")
        hideKeyboard()
    }
    
    override func askForHelp() {
        print("Help button from Sign Up did tap")
    }
}
