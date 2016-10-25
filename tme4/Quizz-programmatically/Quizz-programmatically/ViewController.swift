//
//  ViewController.swift
//  Quizz-programmatically
//
//  Created by m2sar on 25/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenFrame = UIScreen.main.bounds
        self.view = MainView(frame: screenFrame)
        
        /*let current = db.getCurrent()
         self.updateView(question: current.0, answer: current.1, shown: current.2, hard: current.3)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

