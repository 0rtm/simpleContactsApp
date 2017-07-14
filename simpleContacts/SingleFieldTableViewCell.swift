//
//  SingleFieldTableViewCell.swift
//  simpleContacts
//
//  Created by Artem Tselikov on 2017-07-14.
//  Copyright © 2017 Artem Tselikov. All rights reserved.
//

import UIKit


protocol CellWithFieldDelegate: class {

	func textUpdated(withText: String?, textFieldIndex: Int)

}


class SingleFieldTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!

	weak var delegate: CellWithFieldDelegate?

	var index: Int = 0

	@IBOutlet weak var textField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


	@IBAction func editingChanged(_ sender: UITextField) {

		delegate?.textUpdated(withText: sender.text, textFieldIndex: index)

	}
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
