//
//  ContactsManager.swift
//  simpleContacts
//
//  Created by Artem Tselikov on 2017-07-14.
//  Copyright © 2017 Artem Tselikov. All rights reserved.
//

import Foundation
import RealmSwift

class ContactsManager {


	//Saves a contact, updates if one already exists

	static func saveContact(contact: Contact) {

		print("will save \(contact)")

		let realm = try! Realm()

		if contact.contactID == 0 {

			if let last = getLastContact() {
				contact.contactID = last.contactID + 1
			} else {
				contact.contactID = 1
			}
		}

		try! realm.write {

			realm.add(contact, update: true)
		}
	}

	//returns a last contact if it exists
	private static func getLastContact() -> Contact? {

		let last = try! Realm().objects(Contact.self).last
		return last

	}

	static func getAllContacts() -> [Contact]? {

		let all = try! Realm().objects(Contact.self)
		return Array(all)
	}

	//deletes a contact
	static func deleteContact(contact: Contact) {

		print("will delete \(contact)")

		let realm = try! Realm()

		try! realm.write {
			realm.delete(contact)
		}
	}
}
