//
//  AddContactViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 1/6/20.
//  Copyright © 2020 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - AddContactViewController class
class AddContactViewController: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    
    //MARK: - default properties
    var delegate: AddContactViewControllerDelegate?
    
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        companyTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        countryTextField.delegate = self
        cityTextField.delegate = self
        
        phoneNumberTextField.keyboardType = .phonePad
        emailTextField.keyboardType = .emailAddress
    }
    
    override func viewWillAppear(_ animated: Bool) {
        photo.layer.cornerRadius = photo.frame.size.height / 2
        photo.layer.masksToBounds = true
    }
    
    
    //MARK: - actions
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createButtonDidTap(_ sender: UIButton) {
        let newContactPhoto = photo.image ?? nil
        let newContactFirstName = firstNameTextField.text ?? nil
        let newContactLastName = lastNameTextField.text ?? nil
        let newContactCompany = companyTextField.text ?? nil
        //let newContactPhoneNumber = phoneNumberTextField.text ?? nil
        //let newContactEmail = emailTextField.text ?? nil
        let newContactCountry = countryTextField.text ?? nil
        let newContactCity = cityTextField.text ?? nil
        
        let contact = Contact(photo: newContactPhoto, firstName: newContactFirstName, lastName: newContactLastName, company: newContactCompany, /*phoneNumber: newContactPhoneNumber, email: newContactEmail,*/ country: newContactCountry, city: newContactCity)
        
        delegate?.didCreate(contact: contact)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhotoButtonDidTap(_ sender: UIButton) {
        showImagePickerController()
    }
}

//MARK: -
extension AddContactViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField { lastNameTextField.becomeFirstResponder() }
        if textField == lastNameTextField { companyTextField.becomeFirstResponder() }
        if textField == companyTextField { phoneNumberTextField.becomeFirstResponder() }
        if textField == phoneNumberTextField { emailTextField.becomeFirstResponder() }
        if textField == emailTextField { countryTextField.becomeFirstResponder() }
        if textField == countryTextField { cityTextField.becomeFirstResponder() }
        if textField == cityTextField { hideKeyboard() }
        
        return true
    }
}


//MARK: - AddContactViewController extension with UIImagePickerControllerDelegate and UINavigationControllerDelegate
extension AddContactViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - default methods
    func showImagePickerController() {
        let imagePickerAlertController = UIAlertController(title: "Choose your image", message: nil, preferredStyle: .actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
            self.chooseImage(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take from Camera", style: .default) { (action) in
            self.chooseImage(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        imagePickerAlertController.addAction(photoLibraryAction)
        imagePickerAlertController.addAction(cameraAction)
        imagePickerAlertController.addAction(cancelAction)
        
        present(imagePickerAlertController, animated: true, completion: nil)
    }
    
    func chooseImage(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage { photo.image = editedimage }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage { photo.image = originalImage }
        
        dismiss(animated: true, completion: nil)
    }
    
}
