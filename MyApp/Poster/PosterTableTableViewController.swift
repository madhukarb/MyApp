//
//  PosterTableTableViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 12/23/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase

class PosterTableTableViewController: UITableViewController {
    var numberOfPosters = 3
    var posterIcon = UIImage(named: "quiz75")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Quiz_bg.jpg"))
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfPosters
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PosterCell") as? PosterTableViewCell
        cell?.posterThumbNail.image = posterIcon
        cell?.PosterDetai.text = "Demo"
        return cell!
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destvc = segue.destination as? PosterViewController{
            //destvc.image = poster
            print(destvc.accessibilityActivate())
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPoster", sender: Any?.self)
    }

}
