//
//  EditContactViewController.swift
//  simpleContacts
//
//  Created by Artem Tselikov on 2017-07-14.
//  Copyright © 2017 Artem Tselikov. All rights reserved.
//

import UIKit

class EditableValue {

	dynamic let placeHolder: String
	dynamic var keyPath: String

	init(_ placeHolder: String, keyPath: String) {
		self.placeHolder = placeHolder
		self.keyPath = keyPath
	}

}


class EditContactViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var contact: Contact?

	var tempContact: Contact?

	var editableFields: [EditableValue] = []

    override func viewDidLoad() {
        super.viewDidLoad()
		seupContact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)

		if let contact = contact {
			tempContact = Contact(withContentsOf: contact)
		} else {
			tempContact = Contact()
		}

		self.tableView.reloadData()
	}


	fileprivate func seupContact () {

		editableFields = [EditableValue("First name", keyPath: #keyPath(Contact.firstName)),
		                  EditableValue("Last name", keyPath: #keyPath(Contact.lastName)),
		                  EditableValue("Phone number", keyPath: #keyPath(Contact.phoneNumber)),
		                  EditableValue("Address line 1", keyPath: #keyPath(Contact.addrL1)),
		                  EditableValue("Address line 2", keyPath: #keyPath(Contact.addrL2)),
		                  EditableValue("City", keyPath: #keyPath(Contact.city)),
		                  EditableValue("State", keyPath: #keyPath(Contact.state)),
		                  EditableValue("Zip code", keyPath: #keyPath(Contact.zipCode)),
		]


	}
    
	@IBAction func donePressed(_ sender: Any) {

		if let contact = tempContact {
			ContactsManager.saveContact(contact: contact)
		}

		self.dismiss(animated: true, completion: nil)
	}


	@IBAction func cancelPressed(_ sender: Any) {

		self.dismiss(animated: true, completion: nil)
	}

}

extension EditContactViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return editableFields.count
	}


	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell") as! SingleFieldTableViewCell

		let field = editableFields[indexPath.row]

		cell.textField.placeholder = field.placeHolder

		cell.titleLabel.text = field.placeHolder

		if let value = contact?.value(forKeyPath: field.keyPath) as? String {
			cell.textField.text = value
		}

		cell.index = indexPath.row

		cell.delegate = self

		return cell

	}

}

extension EditContactViewController: CellWithFieldDelegate {

	func textUpdated(withText: String?, textFieldIndex: Int) {

		if textFieldIndex > editableFields.count {
			return
		}

		let field = editableFields[textFieldIndex]

		tempContact?.setValue(withText, forKey: field.keyPath)

	}


}
