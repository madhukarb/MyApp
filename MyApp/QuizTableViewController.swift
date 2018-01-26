//
//  QuizTableViewController.swift
//  
//
//  Created by Madhukar Bommala on 12/13/17.
//

import UIKit
import FirebaseDatabase

struct quiz{
    var PublishDate: String
    var Statua: String
    var Winner: String?
}


class QuizTableViewController: UITableViewController {
    
    var activeQuizName : String?
    @IBOutlet weak var quizNumber: UILabel!
    //var model: [(String, String, String)] = [(" "," "," ")]
    var model:[(quizName: String, publishDate: String, winner: String, quizStatus: String)] = []
    
    override func viewDidLoad() {
        tableView.backgroundView = UIImageView(image: UIImage(named: "Quiz_bg.jpg"))
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.alpha = 0.5
        
        self.navigationController?.navigationBar.tintColor = .white
        
        super.viewDidLoad()
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("quiz").observeSingleEvent(of: .value) { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject]
            for quiz in postDict!{
                var tempWinner = " "
                var tempPublishDate = " "
                var tempQuizStatus = " "
                for val in (quiz.value as? Dictionary<String, Any>)!{
                    if val.key == "Publish Date"{
                        tempPublishDate = val.value as! String
                    }
                    if val.key == "Winner"{
                        tempWinner = val.value as! String
                    }
                    if val.key == "Status"{
                        tempQuizStatus = val.value as! String
                    }
                }
                if (tempQuizStatus == "Active" || tempQuizStatus == "Ended"){
                self.model.append((quizName: quiz.key , publishDate: tempPublishDate, winner: tempWinner, quizStatus: tempQuizStatus))
                }
                self.tableView.reloadData()
            }
          
        }
 
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
            return model.count
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let QuizCell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as? QuizTableViewCell
           
            QuizCell?.quizNumber.text = model[indexPath.row].quizName
            QuizCell?.quizWinner.text = model[indexPath.row].winner
            QuizCell?.quizPublishDate.text = model[indexPath.row].publishDate
            
           
            QuizCell?.backgroundColor = UIColor.clear
            if model[indexPath.row].quizStatus != "Active"{
                QuizCell?.quizCellBGView.backgroundColor = UIColor(red:0.23, green:0.51, blue:0.65, alpha:0.85)
                QuizCell?.quizNumber.textColor = UIColor.gray
            }
            return QuizCell!
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destViewController = segue.destination as? QuizViewController{
            destViewController.quizName = "Quiz 0"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if model[indexPath.row].quizStatus == "Active" {
            activeQuizName = model[indexPath.row].quizName
            performSegue(withIdentifier: "ShowQuiz", sender: (Any).self)
        }

    }
    
}
