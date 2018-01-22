//
//  WecomeViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 10/31/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit

class WecomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor(red:0.27, green:0.69, blue:1.00, alpha:1.0)
        welcomeUserName.center.y = view.frame.height
        UIView.animate(withDuration: 2.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 15, options: UIViewAnimationOptions.allowUserInteraction, animations: ({
            self.welcomeUserName.center.y = self.view.frame.height/2
        }), completion: nil)
        
        welcomeUserName.text = "Hello" + "\n" + LoggedInUser.firstName!
        
    }
    
    @IBOutlet weak var welcomeUserName: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        sleep(2)
        performSegue(withIdentifier: "ShowContent", sender: Any?.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
