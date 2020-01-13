//
//  DetailContactTableViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 1/11/20.
//  Copyright © 2020 Sasza Niehaj. All rights reserved.
//

import UIKit
import MessageUI

//MARK: - DetailContactTableViewController class
class DetailContactTableViewController: UITableViewController {
        
    //MARK: - default properties
    var contact: Contact!
    
    
    //MARK: - outlets
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var notesTextField: UITextField!
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberLabel.text = contact.phoneNumber
        
        notesTextField.delegate = self
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int { 3 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows: Int!
        if section == 0 { numberOfRows = 6 }
        if section == 1 { numberOfRows = 1 }
        if section == 2 { numberOfRows = 1 }
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let selectedCell = (section: indexPath.section, row: indexPath.row)
        
        switch selectedCell {
        case (0, 0): call()
        case (0, 1): inputNote()
        case (0, 2): sendMessage()
        case (0, 3): shareContact()
        case (0, 4): print("Add to Favorites")
        case (0, 5): addToEmergencyContact()
        case (1, 0): shareMyLocation()
        case (2, 0): blockThisCaller()
        default: break
        }
    }
    
    //MARK: - default methods
    // Rewrite with static keyword in other class to avoid duplicating code
    func call() {
        let formattedPhoneNumber = contact.phoneNumber.replacingOccurrences(of: " ", with: "")
        guard let url = URL(string: "tel://\(formattedPhoneNumber)") else { return }
        
        guard UIApplication.shared.canOpenURL(url) else { showCallError(); return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func inputNote() {
        notesTextField.becomeFirstResponder()
    }
    
    func shareContact() {
        let shareContactController = UIAlertController(title: contact.description, message: nil, preferredStyle: .actionSheet)
        
        let toPopularContactAction = UIAlertAction(title: "To Popular Contact", style: .default, handler: nil)
        let byMessangerAction = UIAlertAction(title: "By Messangers", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        shareContactController.addAction(toPopularContactAction)
        shareContactController.addAction(byMessangerAction)
        shareContactController.addAction(cancelAction)
        
        present(shareContactController, animated: true, completion: nil)
    }
    
    func addToEmergencyContact() {
        let addToEmergencyContactController = UIAlertController(title: "Relationship", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addToEmergencyContactController.addAction(cancelAction)
        
        present(addToEmergencyContactController, animated: true, completion: nil)
    }
    
    func shareMyLocation() {
        let shareLocationController = UIAlertController(title: "Share My Location", message: nil, preferredStyle: .actionSheet)
        
        let shareForOneHourAction = UIAlertAction(title: "Share for One Hour", style: .default, handler: nil)
        let shareUntilEndOfDayAction = UIAlertAction(title: "Share Until End of Day", style: .default, handler: nil)
        let shareIndefinitelyAction = UIAlertAction(title: "Share Indefinitely", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        shareLocationController.addAction(shareForOneHourAction)
        shareLocationController.addAction(shareUntilEndOfDayAction)
        shareLocationController.addAction(shareIndefinitelyAction)
        shareLocationController.addAction(cancelAction)
        
        present(shareLocationController, animated: true, completion: nil)
    }
    
    func blockThisCaller() {
        let blockThisCallerController = UIAlertController(title: nil, message: "You will not receive phone calls, messages, or FaceTime from people on the block list.", preferredStyle: .actionSheet)
        
        let blockContactAction = UIAlertAction(title: "Block Contact", style: .destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        blockThisCallerController.addAction(blockContactAction)
        blockThisCallerController.addAction(cancelAction)
        
        present(blockThisCallerController, animated: true, completion: nil)
    }
}


//MARK: - DetailContactTableViewController extension with UITextFieldDelegate
extension DetailContactTableViewController: UITextFieldDelegate {
    
    //MARK: - overriden methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == notesTextField { hideKeyboard() }
        return true
    }
    
}

//MARK: - DetailContactTableViewController extension with MFMessageComposeViewControllerDelegate
// Rewrite with static keyword in other class to avoid duplicating code
extension DetailContactTableViewController: MFMessageComposeViewControllerDelegate {
    
    //MARK: - overriden methods
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - temporary default methods
    func sendMessage() {
        guard MFMessageComposeViewController.canSendText() else { showSendMessageError(); return }
        present(configureMessageController(), animated: true, completion: nil)
    }
    
    func configureMessageController() -> MFMessageComposeViewController {
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = [contact.phoneNumber]
        composeVC.body = "Hello from California!"
                
        return composeVC
    }
}


//MARK: - DetailContactTableViewController with error methods
// Rewrite with static keyword in other class to avoid duplicating code
extension DetailContactTableViewController {
    
    func showCallError() {
        let callErrorController = UIAlertController(title: "Could not call", message: "This app is not allowed to query for scheme tel.", preferredStyle: .alert)
        let callErrorAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        callErrorController.addAction(callErrorAction)
        present(callErrorController, animated: true, completion: nil)
    }
    
    func showSendMessageError() {
        let sendMessageErrorController = UIAlertController(title: "Could not sent message", message: "Your device could not send message.", preferredStyle: .alert)
        let sendMessageErrorAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        sendMessageErrorController.addAction(sendMessageErrorAction)
        self.present(sendMessageErrorController, animated: true, completion: nil)
    }
    
}
