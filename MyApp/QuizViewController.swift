//
//  QuizViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 12/19/17.
//  Copyright © 2017 Madhukar. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct QuizQuestionAnswer {
    var question : String
    var answer : [String]
    var correctAnswer : Int
    var usersSelectedAnswer : String?
}
class QuizViewController: UIViewController {
    var ref : DatabaseReference = Database.database().reference()
    var quizArray : [QuizQuestionAnswer] = []
    var dispQuestionIndex  = 0
    
    @IBOutlet weak var AnswerOne: UIButton!
    @IBOutlet weak var AnswerTwo: UIButton!
    @IBOutlet weak var AnswerThree: UIButton!
    @IBOutlet weak var AnswerFour: UIButton!
    
    @IBOutlet weak var DisplayQuestion: UILabel!
    
     override func viewWillAppear(_ animated: Bool) {
        print("will appr called")
        ref.child("quiz").child("Quiz 0").child("Questions").observeSingleEvent(of: .value) { (snapshot) in
            let dictSnapshot = snapshot.value as? NSDictionary
            for dict in dictSnapshot! {

                let question = dict.key as? String
                var answerSet = [String?]()
                var correctAns : Int?

                for ans in (dict.value as? NSDictionary)!{
                    answerSet.append(ans.key as? String)
                    if ans.value as? String == "True"{
                        correctAns = answerSet.count - 1
                    }
                }
                let tempQuestionAnswer = QuizQuestionAnswer(question: question!, answer: answerSet as! [String], correctAnswer: correctAns!, usersSelectedAnswer: nil)
                print("new")
                print(tempQuestionAnswer)
                self.quizArray.append(tempQuestionAnswer)
                
            }
            self.LoadQuestionAnswer(qaSet: self.quizArray[0])
            print(self.quizArray)
        }

    }
    override func viewDidLoad() {
        print("did load called")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
     //LoadQuestionAnswer(qaSet: quizArray[0])
    }
    
    func LoadQuestionAnswer(qaSet : QuizQuestionAnswer){
        DisplayQuestion.text = qaSet.question
        AnswerOne.setTitle(qaSet.answer[0], for: UIControlState.normal)
        AnswerTwo.setTitle(qaSet.answer[1], for: UIControlState.normal)
        AnswerThree.setTitle(qaSet.answer[2], for: UIControlState.normal)
        AnswerFour.setTitle(qaSet.answer[3], for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var dispQuestion: UILabel!
    
    func ResetSelection(selectedButton : UIButton) {
        AnswerOne.backgroundColor = UIColor(red:1.00, green:0.58, blue:0.00, alpha:1.0)
        AnswerTwo.backgroundColor = UIColor(red:1.00, green:0.58, blue:0.00, alpha:1.0)
        AnswerThree.backgroundColor = UIColor(red:1.00, green:0.58, blue:0.00, alpha:1.0)
        AnswerFour.backgroundColor = UIColor(red:1.00, green:0.58, blue:0.00, alpha:1.0)
        
        AnswerOne.isSelected = false
        AnswerTwo.isSelected = false
        AnswerThree.isSelected = false
        AnswerFour.isSelected = false
    }
    
    
    @IBAction func AnswerSelected(_ sender: UIButton) {
        ResetSelection(selectedButton: sender)
        sender.backgroundColor = UIColor.red
        sender.isSelected = true
        quizArray[dispQuestionIndex].usersSelectedAnswer = sender.titleLabel?.text!
    }
    

    @IBAction func ShowNextQuestion(_ sender: Any) {
        ResetSelection(selectedButton: sender as! UIButton)
        if dispQuestionIndex < quizArray.count - 1{
        dispQuestionIndex = dispQuestionIndex + 1
            switch quizArray[dispQuestionIndex].usersSelectedAnswer {
            case quizArray[dispQuestionIndex].answer[0]?: AnswerOne.backgroundColor = UIColor.red
            case quizArray[dispQuestionIndex].answer[1]?: AnswerTwo.backgroundColor = UIColor.red
            case quizArray[dispQuestionIndex].answer[2]?: AnswerThree.backgroundColor = UIColor.red
            case quizArray[dispQuestionIndex].answer[3]?: AnswerFour.backgroundColor = UIColor.red
            default: ResetSelection(selectedButton: sender as! UIButton)
            }
        LoadQuestionAnswer(qaSet: quizArray[dispQuestionIndex])
        }
    }
    
    @IBAction func AnswerSubmitted(_ sender: UIButton) {
        print(quizArray)
    }
    
    @IBAction func ShowPreviousQuestion(_ sender: Any) {
        ResetSelection(selectedButton: sender as! UIButton)
        
        if dispQuestionIndex > 0{
            dispQuestionIndex = dispQuestionIndex - 1
            switch quizArray[dispQuestionIndex].usersSelectedAnswer {
            case quizArray[dispQuestionIndex].answer[0]?: AnswerOne.backgroundColor = UIColor.red
                case quizArray[dispQuestionIndex].answer[1]?: AnswerTwo.backgroundColor = UIColor.red
                case quizArray[dispQuestionIndex].answer[2]?: AnswerThree.backgroundColor = UIColor.red
                case quizArray[dispQuestionIndex].answer[3]?: AnswerFour.backgroundColor = UIColor.red
            default: ResetSelection(selectedButton: sender as! UIButton)
            }
            LoadQuestionAnswer(qaSet: quizArray[dispQuestionIndex])
        }
    }
}
