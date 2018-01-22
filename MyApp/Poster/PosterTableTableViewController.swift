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
    var poster : UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Quiz_bg.jpg"))
        var imageRef: StorageReference {
            return Storage.storage().reference().child("Posters").child("DSC_1598.jpg")
        }
        
        let downLoadTask = imageRef.getData(maxSize: 1024 * 1024 * 10) { (data, error) in
            if let data = data {
                self.poster = UIImage(data: data)
            } else {
                self.poster = self.posterIcon
            }
            
        }
        
        downLoadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO PROGRESS")
        }

        downLoadTask.resume()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("count returnde")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfPosters
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PosterCell") as? PosterTableViewCell
        cell?.posterThumbNail.image = posterIcon
        cell?.PosterDetai.text = " demo"
        print("tableviewcalled")
        return cell!
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destvc = segue.destination as? PosterViewController{
            destvc.image = poster
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPoster", sender: Any?.self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
