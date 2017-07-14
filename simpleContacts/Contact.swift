//
//  Contact.swift
//  simpleContacts
//
//  Created by Artem Tselikov on 2017-07-14.
//  Copyright © 2017 Artem Tselikov. All rights reserved.
//

import Foundation
import RealmSwift


class Contact: Object {

	dynamic var firstName: String?
	
	dynamic var lastName: String?

	dynamic var contactID: Int = 0
	
	dynamic var phoneNumber: String = ""

	override static func primaryKey() -> String? {
		return "contactID"
	}

	//dynamic var address: Address?


	convenience init(withContentsOf contact: Contact) {

		self.init()
		
		firstName = contact.firstName
		lastName = contact.lastName
		contactID = contact.contactID
		phoneNumber = contact.phoneNumber
	}
}
