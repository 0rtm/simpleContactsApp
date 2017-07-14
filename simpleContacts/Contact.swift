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

	dynamic var contactID: Int = 0

	override static func primaryKey() -> String? {
		return "contactID"
	}

	dynamic var firstName: String?
	
	dynamic var lastName: String?

	dynamic var phoneNumber: String = ""

	dynamic var city: String?

	dynamic var addrL1: String?

	dynamic var addrL2: String?

	dynamic var state: String?

	dynamic var zipCode: String?

	convenience init(withContentsOf contact: Contact) {

		self.init()
		
		firstName = contact.firstName
		lastName = contact.lastName
		contactID = contact.contactID
		phoneNumber = contact.phoneNumber
		city = contact.city
		addrL1 = contact.addrL1
		addrL2 = contact.addrL2
		state = contact.state
		zipCode = contact.zipCode
		
	}
}
