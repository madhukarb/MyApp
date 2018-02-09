//
//  AboutViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 2/7/18.
//  Copyright © 2018 Madhukar. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutText: UILabel!
    @IBOutlet weak var aboutView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.layer.cornerRadius = 10
        aboutText.text = "About:\nAbout the App\n\nDevelopers: \nMadhukar Bommala\nVengatesh\n\nTeam:\nSangeeth"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dismissAboutvc(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
