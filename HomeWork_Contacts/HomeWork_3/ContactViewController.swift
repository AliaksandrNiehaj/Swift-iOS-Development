//
//  ContactViewController.swift
//  HomeWork_3
//
//  Created by Sasza Niehaj on 12/23/19.
//  Copyright © 2019 Sasza Niehaj. All rights reserved.
//

import UIKit

//MARK: - ContactViewController class
class ContactViewController: BaseViewController {
    
    //MARK: - outlets
    @IBOutlet weak var contactTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - default properties
    var contactViewControllerTitle = "Contacts"
    let detailSegueID = "detailSegueID"
    let addContactSegueID = "addContactSegueID"
    var detailedStoryboardID = "DetailContactViewController"
    let contactCellIdentifier = "contactCell"
    var isSearching = false
    var selectedContact: Contact?
    
    
    //MARK: - lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = contactViewControllerTitle
        searchBar.delegate = self
        contactTableView.delegate = self
        contactTableView.dataSource = self
    }
    
    
    //MARK: - actions
    @IBAction func addButtonDidTap(_ sender: Any) {
        performSegue(withIdentifier: addContactSegueID, sender: self)
    }
    
    @IBAction func editButtonDidTap(_ sender: Any) {
        contactTableView.isEditing = !contactTableView.isEditing
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addContactCV = segue.destination as? AddContactViewController else { return }
        addContactCV.delegate = self
    }
}


//MARK: - ContactViewControllerExtension: UITableViewDataSource
extension ContactViewController: UITableViewDataSource {
    
    
    //MARK: - default methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = contacts.count
        if isSearching { numberOfRows = searchContacts.count }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var contact: Contact
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: contactCellIdentifier, for: indexPath) as? BaseCell
            else { fatalError("Can't not find cell with identifier \(contactCellIdentifier) at indexPath: \(indexPath).") }
        
        if isSearching { contact = searchContacts[indexPath.row] } else { contact = contacts[indexPath.row] }
        
        cell.update(with: contact)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        contacts.remove(at: indexPath.row)
        contactTableView.deleteRows(at: [indexPath], with: .left)
    }
}


//MARK: - ContactViewControllerExtension: UITableViewDelegate
extension ContactViewController: UITableViewDelegate {
    
    //MARK: - default methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let contact = contacts[indexPath.row]
        selectedContact = contact
        
        guard let detailedVC = storyboard?.instantiateViewController(identifier: detailedStoryboardID) as? DetailContactViewController else { return }
        detailedVC.contact = selectedContact
        navigationController?.pushViewController(detailedVC, animated: true)
    }
}


//MARK: - ContactViewController with AddContactViewControllerDelegate
extension ContactViewController: AddContactViewControllerDelegate {
    func didCreate(contact: Contact) {
        contacts.append(contact)
        contactTableView.reloadData()
    }
}

//MARK: - ContactViewController with UISearchBarDelegate
extension ContactViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchContacts = contacts.filter({ $0.description.lowercased().prefix(searchText.count) == searchText.lowercased() })
        isSearching = true
        contactTableView.reloadData()
    }
}
