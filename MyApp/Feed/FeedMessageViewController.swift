//
//  FeedMessageViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 1/11/18.
//  Copyright © 2018 Madhukar. All rights reserved.
//

import UIKit

class FeedMessageViewController: UIViewController {
    
    var messageText : String?
    var date: String?
    var messageBy: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLable.text = messageText
        publishDate.text = date
        authorName.text = messageBy
    }
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
