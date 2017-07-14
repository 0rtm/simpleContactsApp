//
//  ContactsListViewController.swift
//  simpleContacts
//
//  Created by Artem Tselikov on 2017-07-14.
//  Copyright © 2017 Artem Tselikov. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {

	@IBOutlet weak var contactsTableView: UITableView!

	var contacts:[Contact] = []

	var selectedContact:Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		
		reloadContacts()

	}


	fileprivate func reloadContacts() {

		contacts = ContactsManager.getAllContacts()!

		self.contactsTableView.reloadData()

	}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if segue.identifier == "showContact" {

			let destVC = segue.destination as! ContactInfoViewController

			destVC.contact = selectedContact

		} else if segue.identifier == "showEdit" {

			// since it root is navigation contoller
			let destVC = segue.destination.childViewControllers.first as! EditContactViewController

			destVC.contact = selectedContact
		}

    }

	override func viewWillDisappear(_ animated: Bool) {

		selectedContact = nil

	}


}


extension ContactsListViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return contacts.count
	}



	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell")!

		let contact = contacts[indexPath.row]

		cell.textLabel?.text = contact.firstName

		return cell

	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		selectedContact = contacts[indexPath.row]

		tableView.deselectRow(at: indexPath, animated: true)

		performSegue(withIdentifier: "showContact", sender: nil)
	}

}
