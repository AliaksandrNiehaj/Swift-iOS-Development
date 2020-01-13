//
//  BaseCell.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/30/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - BaseCell class
class BaseCell: UITableViewCell {
    
    //MARK: - outlets
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var isFavorite: UIButton!
    
    
    //MARK: - default properties
    var contact: Contact!
    
    
    //MARK: - lifeCycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        photo.layer.cornerRadius = photo.frame.size.height / 2
        photo.layer.masksToBounds = true
    }
    
    
    //MARK: - action
    @IBAction func didIsFavotiteButtonTap(_ sender: Any) {
        guard var contact = contact else { return }
        
        let isFavorite = contact.isFavorite
        contact.isFavorite = !isFavorite
        
        // to  write logic for adding in favoriteContactsArray
        if contact.isFavorite { print("False -> True") }
        else { print("True -> False") }
        
        refreshIsFavoriteButton()
    }
    
    
    //MARK: - default methods
    func refreshIsFavoriteButton() {
        guard let contact = contact else { return }
        
        contact.isFavorite ? isFavorite.setImage(UIImage(named: InitializationHelper.favoriteContactSign ), for: .normal) : isFavorite.setImage(UIImage(named: InitializationHelper.nonFavoriteContactSign), for: .normal)
    }
    
    func update(with contact: Contact) {
        self.contact = contact
        
        fullName.text = contact.description
        photo.image = contact.photo ?? UIImage(named: InitializationHelper.unknownPhotoSign)
        refreshIsFavoriteButton()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
