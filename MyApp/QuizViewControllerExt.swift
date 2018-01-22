//
//  QuizViewControllerExt.swift
//  MyApp
//
//  Created by Madhukar Bommala on 1/20/18.
//  Copyright © 2018 Madhukar. All rights reserved.
//

import Foundation

extension QuizViewController {
    func reloadSavedAnswers(){
        var savedAnswers  = UserDefaults.standard.dictionary(forKey: "usersSavedAnswers")
        for questionNumber in 0..<(quizArray.count){
            quizArray[questionNumber].usersSelectedAnswer = (savedAnswers?[quizArray[questionNumber].question] as? String)
        }
    }
}
