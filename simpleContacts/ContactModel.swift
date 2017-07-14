//
//  ContactModel.swift
//  simpleContacts
//
//  Created by Artem Tselikov on 2017-07-14.
//  Copyright © 2017 Artem Tselikov. All rights reserved.
//

import Foundation
import RealmSwift

class ContactModel: Object {

	dynamic var contactID: String = ""

	dynamic var firstName: String  = ""

	dynamic var lastName: String? = nil

	dynamic var phoneNumber: String = ""

	dynamic var city: String? = nil

	dynamic var state: String? = nil

	dynamic var zipCode: String? = nil

}
