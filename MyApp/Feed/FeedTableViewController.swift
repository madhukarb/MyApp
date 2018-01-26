 //
//  FeedTableViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 12/24/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit
import Firebase

class FeedTableViewController: UITableViewController {

    var feeds : [Feed] = []
    var messageText : String?
    var date : String?
    var author : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Quiz_bg.jpg"))
        let ref = Database.database().reference()
        ref.child("Feed").observeSingleEvent(of: .value) { (snapshot) in
            let feedDict = snapshot.value as? NSArray
            for arrayElement  in feedDict!{
            let arryDict = arrayElement as? NSDictionary
                
                let tempFeed = Feed(Date: arryDict?["Date"] as! String, Message: arryDict?["Message"] as! String, Header: arryDict?["MessageHeader"] as! String, Name: arryDict?["Name"] as! String)
                self.feeds.append(tempFeed)
              
            }
            self.tableView.rowHeight = self.view.bounds.height/10
            self.tableView.reloadData()
        }
        self.navigationController?.navigationBar.tintColor = .white
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
        // #warning Incomplete implementation, return the number of rows
        return feeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feedCell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedTableViewCell
        
        feedCell?.feedPublishDate.text = feeds[indexPath.row].Date
        feedCell?.feedPublisgerName.text = feeds[indexPath.row].Name
        feedCell?.feedHeader.text = feeds[indexPath.row].Header

        return feedCell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        messageText = feeds[indexPath.row].Message
        date = feeds[indexPath.row].Date
        author = feeds[indexPath.row].Name
        performSegue(withIdentifier: "ShowMessage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destvc = segue.destination as? FeedMessageViewController{
            destvc.messageText = messageText
            destvc.messageBy = author
            destvc.date = date
            destvc.title = "Message"
        }
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
