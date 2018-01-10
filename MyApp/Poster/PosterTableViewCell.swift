//
//  PosterTableViewCell.swift
//  MyApp
//
//  Created by Madhukar Bommala on 12/23/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit

class PosterTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    @IBOutlet weak var PosterDetai: UILabel!
    @IBOutlet weak var posterThumbNail: UIImageView!
}
