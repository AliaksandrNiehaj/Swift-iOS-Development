//
//  Contact.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/23/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - Contact
public struct Contact: CustomStringConvertible {
    
    //MARK: - public properties
    public var description: String {
        return "\(firstName ?? "")" + " " + "\(lastName ?? "")"
    }
    
    // to rewrite later
    public var placeDescription: String {
        if let country = country, let city = city, !country.isEmpty, !city.isEmpty { return "\(country), \(city)" }
        else if let country = country, !country.isEmpty { return "\(country)" }
        else if let city = city, !city.isEmpty { return "\(city)" }
        
        return ""
    }
    
    //MARK: - default properties
    var photo: UIImage?
    var firstName: String?
    var lastName: String?
    var company: String?
    //var phoneNumber: String?
    var phoneNumber = "+375 (29) 777-66-55"
    //var email: String?
    var email = "helloAd@gmail.com"
    var country: String?
    var city: String?
    
    var isFavorite: Bool {
        get { UserDefaults.standard.bool(forKey: description) }
        set { UserDefaults.standard.setValue(newValue, forKey: description) }
    }
}
