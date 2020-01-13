//
//  BaseViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/29/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - BaseViewController class
class BaseViewController: UIViewController {
    
    //MARK: - default properies
    var contact: Contact!
    var searchContacts: [Contact] = []
    var contacts = [
        Contact(photo: UIImage(named: "1"), firstName: "Den", lastName: "Brawn", country: "USA", city: "Chicago"),
        Contact(photo: UIImage(named: "2"), firstName: "Nick", lastName: "Gordon", country: nil, city: "Minsk"),
        Contact(photo: UIImage(named: "3"), firstName: "Cristianu", lastName: "Rodrigez", country: "Australia", city: "Canberra"),
        Contact(photo: nil, firstName: "Adi", lastName: "Gotler", country: "Germany", city: "Berlin"),
        Contact(photo: UIImage(named: "4"), firstName: "Sara", lastName: "Connoeri", country: "Italy", city: "Roma"),
        Contact(photo: nil, firstName: "Vera", lastName: "Ivanova", country: "Russia", city: nil),
        Contact(photo: UIImage(named: "5"), firstName: "Sara", lastName: "Colibri", country: "Israel", city: "Tel Aviv"),
        Contact(photo: UIImage(named: "6"), firstName: "Helen", lastName: "Extasy", country: "Netherlands", city: "Amsterdam"),
        Contact(photo: nil, firstName: "Piter", lastName: "Askins", country: "Canada", city: "Ottawa"),
        Contact(photo: UIImage(named: "7"), firstName: "Darina", lastName: "Kozyreva", country: "Belarus", city: "Grodno"),
        Contact(photo: nil, firstName: "Rudi", lastName: "Gotler", country: "Germany", city: "Bremen"),
        Contact(photo: UIImage(named: "8"), firstName: "Svetlana", lastName: "Lindemann", country: "Ukraine", city: nil),
        Contact(photo: UIImage(named: "9"), firstName: "Indiroma", lastName: "Gander", country: "India", city: "Delhi"),
        Contact(photo: nil, firstName: "Matmuer", lastName: "Gander", country: nil, city: nil)
    ]
    var favoriteContacts: [Contact]!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
