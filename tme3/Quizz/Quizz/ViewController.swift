//
//  ViewController.swift
//  Quizz
//
//  Created by m2sar on 15/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

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
    
    init(){
        
    }
    
    func getCurrent () -> (String, String, Bool, Bool) {
        return questions[current]
    }
    
    func setCurrentToShown () {
        questions[current].2 = true
    }

    func getPrevious (modeBalaiseOn: Bool) -> (String, String, Bool, Bool) {
        // Circle loop through array
        debugPrint("PREV QUEST: %d", current)
        debugPrint(modeBalaiseOn)
        repeat{
            current = (current - 1) % (questions.count)
            if(questions[current].3 == modeBalaiseOn){
                return questions[current]
            }
            debugPrint("current: %d", current)
        }while true
    }

    func getNext (modeBalaiseOn: Bool) -> (String, String, Bool, Bool) {
        debugPrint("NEXT QUEST: %d", current)
        debugPrint("QUEST size: %d", questions.count)
        
        // Circle loop through array
        repeat{
            current = (current + 1) % (questions.count)
            if(questions[current].3 == modeBalaiseOn){
                return questions[current]
            }
            debugPrint("current: %d", current)
        }while true
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var previousQuestionButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!

    @IBOutlet weak var modeSwitcher: UISwitch!
    @IBOutlet weak var answersShownNumber: UILabel!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var showAnswer: UIButton!
    
    let db = DBQuestionAnswers()
    let previousQBImage = UIImage(named: "previousQuestion")
    let nextQBImage = UIImage(named: "nextQuestion")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousQuestionButton.setImage(previousQBImage, for: UIControlState.normal)
        nextQuestionButton.setImage(nextQBImage, for: UIControlState.normal)

        previousQuestionButton.tag = 0
        nextQuestionButton.tag = 1

        let current = db.getCurrent()
        self.updateView(question: current.0, answer: current.1, shown: current.2, hard: current.3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onShowAnswerClicked(_ sender: AnyObject) {
        let current = db.getCurrent()
        db.setCurrentToShown()
        answerText.text = current.1
    }
    
    @IBAction func onNextPreviousClicked(_ sender: AnyObject) {
        if(sender.tag == 0){
            let current = db.getPrevious(modeBalaiseOn: modeSwitcher.isOn)
            self.updateView(question: current.0, answer: current.1, shown: current.2, hard: current.3)
        }else{
            let current = db.getNext(modeBalaiseOn: modeSwitcher.isOn)
            self.updateView(question: current.0, answer: current.1, shown: current.2, hard: current.3)
        }
    }
    
    @IBAction func onModeSwitcherClicked(_ sender: AnyObject) {
    }
    
    func updateView(question: String, answer: String, shown: Bool, hard: Bool) {
        debugPrint("updating the view: " + answer)
        questionText.text = question
        if(shown){
            answerText.text = answer
        }
        if(hard){
            let redColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 1)
            questionText.textColor = redColor
            answerText.textColor = redColor
        }
    }
}

