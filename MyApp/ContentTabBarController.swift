//
//  ContentTabBarController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 10/29/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit

class ContentTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.title = tabBar.items?[0].title
        self.tabBar.items?[0].image = UIImage(named: "quiz75")
        self.tabBar.items?[1].image = UIImage(named: "Poster75")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = tabBar.selectedItem?.title
    }

}
