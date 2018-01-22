//
//  QuizTableViewCell.swift
//  MyApp
//
//  Created by Madhukar Bommala on 12/18/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var quizWinner: UILabel!
    @IBOutlet weak var quizPublishDate: UILabel!
    @IBOutlet weak var quizNumber: UILabel!
    
    @IBOutlet weak var quizCellBGView: UIView!
}
