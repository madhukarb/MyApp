//
//  SettingTableViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 10/31/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func FrescoTalk(_ sender: Any) {
        let friscoPlay = "talkfresco://"
        let friscoPlayUrl = URL(string: friscoPlay)
        if UIApplication.shared.canOpenURL(friscoPlayUrl!)
        {
            UIApplication.shared.open(friscoPlayUrl!)
        } else {
            UIApplication.shared.open(friscoPlayUrl!, options: [:], completionHandler: nil)
        }
        
    }
    
    
    @IBAction func FrescoPlay(_ sender: Any) {
        let friscoPlay = "frescoplay://"
        let friscoPlayUrl = URL(string: friscoPlay)
        if UIApplication.shared.canOpenURL(friscoPlayUrl!)
        {
            UIApplication.shared.open(friscoPlayUrl!)
        } else {
            UIApplication.shared.open(URL(string: "play.fresco.com")!, options: [:], completionHandler: nil)
        }
    }

}
