//
//  AnswerTableCell.swift
//  quiz_app
//
//  Created by Jordan Burton on 10/13/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import UIKit

class AnswerTableCell: UITableViewCell {
    
    @IBOutlet weak var mAnswerText: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
