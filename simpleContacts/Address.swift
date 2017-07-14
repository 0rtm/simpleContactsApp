//
//  Address.swift
//  simpleContacts
//
//  Created by Artem Tselikov on 2017-07-14.
//  Copyright © 2017 Artem Tselikov. All rights reserved.
//

import Foundation
import RealmSwift


class Address: Object {

	dynamic var city: String? = nil

	dynamic var state: String? = nil

	dynamic var zipCode: String? = nil

}
