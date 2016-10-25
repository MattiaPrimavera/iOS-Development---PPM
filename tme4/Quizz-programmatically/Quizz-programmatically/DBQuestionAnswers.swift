//
//  DBQuestionAnswers.swift
//  Quizz-programmatically
//
//  Created by m2sar on 25/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import Foundation

class DBQuestionAnswers{
    private var current = 0
    
    // Q1, A1, Seen(Boolean), Hard(Boolean)
    private var questions = [
        ("Q1", "A1", false, false),
        ("Q2", "A2", false, false),
        ("Q3", "A3", false, true),
        ("Q4", "A4", false, false),
        ("Q5", "A5", false, true)
    ]
    
    init(){}
    
    func getCurrent () -> (String, String, Bool, Bool) {
        return questions[current]
    }
    
    func setCurrentToShown () {
        questions[current].2 = true
    }
    
    func getPrevious (modeBalaiseOn: Bool) -> (String, String, Bool, Bool) {
        // Circle loop through array
        repeat{
            current = (current - 1) % (questions.count)
            if(current < 0){
                current *= -1
            }
            
            if(questions[current].3 == modeBalaiseOn){
                return questions[current]
            }
        }while true
    }
    
    func getNext (modeBalaiseOn: Bool) -> (String, String, Bool, Bool) {
        // Circle loop through array
        repeat{
            current = (current + 1) % (questions.count)
            if(questions[current].3 == modeBalaiseOn){
                return questions[current]
            }
        }while true
    }
}
