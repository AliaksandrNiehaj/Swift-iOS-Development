//
//  ViewControllerExtension.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 1/11/20.
//  Copyright © 2020 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - UIViewController extension
extension UIViewController {
    
    //MARK: - default methods
    func hideKeyboard() { view.endEditing(true) }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
}
