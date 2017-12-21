//
//  QuizTableViewController.swift
//  
//
//  Created by Madhukar Bommala on 12/13/17.
//

import UIKit
import FirebaseDatabase

class QuizTableViewController: UITableViewController {
    
    
    @IBOutlet weak var quizNumber: UILabel!
    //var model: [(String, String, String)] = [(" "," "," ")]
    var model:[(quizName: String, publishDate: String, winner: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("quiz").observeSingleEvent(of: .value) { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject]
            for quiz in postDict!{
                //print(quiz.key)
                var tempWinner = " "
                var tempPublishDate = " "
                for val in (quiz.value as? Dictionary<String, Any>)!{
                    if val.key == "Publish Date"{
                        tempPublishDate = val.value as! String
                    }
                    if val.key == "Winner"{
                        tempWinner = val.value as! String
                    }
                }
                self.model.append((quizName: quiz.key , publishDate: tempPublishDate, winner: tempWinner))
                self.tableView.reloadData()
            }
            
          
        }
            
        
        print(model)
        print(model.count)
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
            print(model.count)
            return model.count
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let QuizCell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as? QuizTableViewCell
           
            //QuizCell.textLabel?.text = model[indexPath.row].quizName
            //QuizCell.detailTextLabel?.text = model[indexPath.row].publishDate
            QuizCell?.quizNumber.text = model[indexPath.row].quizName
            QuizCell?.quizWinner.text = model[indexPath.row].winner
            QuizCell?.quizPublishDate.text = model[indexPath.row].publishDate
            if indexPath.row == 0 {
            QuizCell?.backgroundColor = UIColor.blue
            }
           
            
            return QuizCell!
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
