//
//  DetailContactViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/25/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit
import MessageUI

//MARK: - DetailContactViewController class
class DetailContactViewController: UIViewController {
    
    //MARK: - outlets
    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var contactFullName: UILabel!
    @IBOutlet weak var contactPlace: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var additionalContainerView: UIView!
    
    
    //MARK: - default properties
    var contact: Contact!
    
    
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactPhoto.image = contact.photo ?? UIImage(named: InitializationHelper.unknownPhotoSign)
        contactFullName.text = contact.description
        contactPlace.text = contact.placeDescription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contactPhoto.layer.cornerRadius = contactPhoto.frame.size.height / 2
        contactPhoto.layer.masksToBounds = true
        
        messageButton.layer.cornerRadius = messageButton.frame.size.height / 2
        messageButton.layer.masksToBounds = true
        
        callButton.layer.cornerRadius = callButton.frame.size.height / 2
        callButton.layer.masksToBounds = true
        
        videoButton.layer.cornerRadius = videoButton.frame.size.height / 2
        videoButton.layer.masksToBounds = true
        
        mailButton.layer.cornerRadius = mailButton.frame.size.height / 2
        mailButton.layer.masksToBounds = true
    }
    
    
    //MARK: - outlets
    // Rewrite with static keyword in other class to avoid duplicating code
    @IBAction func messageButtonDidTap(_ sender: Any) {
        guard MFMessageComposeViewController.canSendText() else { showSendMessageError(); return }
        present(configureMessageController(), animated: true, completion: nil)
    }
    
    // Rewrite with static keyword in other class to avoid duplicating code
    @IBAction func callButtonDidTap(_ sender: Any) {
        let scheme = "tel"
        initiateCall(withScheme: scheme)
    }
    
    // Rewrite with static keyword in other class to avoid duplicating code
    @IBAction func videoButtonDidTap(_ sender: Any) {
        let scheme = "facetime"
        initiateCall(withScheme: scheme)
    }
    
    @IBAction func mailButtonDidTap(_ sender: Any) {
        guard MFMailComposeViewController.canSendMail() else { showSendEmailError(); return }
        present(configureMailController(), animated: true, completion: nil)
    }
    
    
    //MARK: - default overriden methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailContactTableViewController else { return }
        vc.contact = contact
    }
    
    //MARK: - default methods
    // Rewrite with static keyword in other class to avoid duplicating code
    func initiateCall(withScheme scheme: String) {
        let formattedPhoneNumber = contact.phoneNumber.replacingOccurrences(of: " ", with: "")
        guard let url = URL(string: "\(scheme)://\(formattedPhoneNumber)") else { return }
        
        guard UIApplication.shared.canOpenURL(url) else { showCallError(by: scheme); return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

//MARK: - DetailContactViewController extension with MFMessageComposeViewControllerDelegate
// Rewrite with static keyword in other class to avoid duplicating code
extension DetailContactViewController: MFMessageComposeViewControllerDelegate {
    
    //MARK: - overriden methods
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - default methods
    func configureMessageController() -> MFMessageComposeViewController {
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = [contact.phoneNumber]
        composeVC.body = "Hello from California!"
                
        return composeVC
    }
}


//MARK: - DetailContactViewController with MFMailComposeViewControllerDelegate
// Rewrite with static keyword in other class to avoid duplicating code
extension DetailContactViewController: MFMailComposeViewControllerDelegate {
    
    //MARK: - overriden methods
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - default methods
    func configureMailController() -> MFMailComposeViewController {
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        composeVC.setToRecipients([contact.email])
        composeVC.setSubject("Hello!")
        composeVC.setMessageBody("Hello from California!", isHTML: false)
                
        return composeVC
    }
}


//MARK: - DetailContactViewController with error methods
// Rewrite with static keyword in other class to avoid duplicating code
extension DetailContactViewController {
    
    func showCallError(by scheme: String) {
        let callErrorController = UIAlertController(title: "Could not call", message: "This app is not allowed to query for scheme \(scheme).", preferredStyle: .alert)
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
    
    func showSendEmailError() {
        
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        sendMailErrorAlert.addAction(dismissAction)
        present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
}
