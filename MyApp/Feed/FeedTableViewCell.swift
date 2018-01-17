//
//  FeedTableViewCell.swift
//  MyApp
//
//  Created by Madhukar Bommala on 12/24/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var feedPublisgerName: UILabel!
    @IBOutlet weak var feedHeader: UILabel!
    @IBOutlet weak var feedPublishDate: UILabel!
}
