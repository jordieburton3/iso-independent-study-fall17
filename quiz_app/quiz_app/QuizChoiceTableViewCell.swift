//
//  QuizChoiceTableViewCell.swift
//  quiz_app
//
//  Created by Jordan Burton on 11/16/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import UIKit

class QuizChoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var mQuizChoiceText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
