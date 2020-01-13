//
//  AddContactViewControllerDelegate.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 1/6/20.
//  Copyright © 2020 Sasza Niehaj. All rights reserved.
//

import Foundation

//MARK: - AddContactViewController Delegate
protocol AddContactViewControllerDelegate {
    
    //MARK: - methods
    func didCreate(contact: Contact)
}
