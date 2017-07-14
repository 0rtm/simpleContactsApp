//
//  ContactInfoViewController.swift
//  simpleContacts
//
//  Created by Artem Tselikov on 2017-07-14.
//  Copyright © 2017 Artem Tselikov. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController {


	var contact: Contact?

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var LastNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	override func viewWillAppear(_ animated: Bool) {
		showContactInfo()
	}


	fileprivate func showContactInfo() {

		nameLabel.text = contact?.firstName
		LastNameLabel.text = contact?.lastName

	}

	@IBAction func deleteContactPressed(_ sender: Any) {


		guard let contact = contact else {

			return
		}

		ContactsManager.deleteContact(contact: contact)

		self.navigationController?.popViewController(animated: true)

	}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.


		if segue.identifier == "showEditFromInfo" {

			let dest = segue.destination.childViewControllers.first as! EditContactViewController

			dest.contact = contact

		}
    }


}
