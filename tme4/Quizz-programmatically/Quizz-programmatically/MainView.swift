//
//  MainView.swift
//  Quizz-programmatically
//
//  Created by m2sar on 25/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class MainView: UIView{
    fileprivate var previousQuestionButton = UIButton()
    fileprivate var nextQuestionButton = UIButton()
    
    required override init(frame: CGRect){
        super.init(frame: frame)
        
        let previousQBImage = UIImage(named: "previousQuestion")
        let nextQBImage = UIImage(named: "nextQuestion")
        //var answersShown = 0
        
        //let viewHeight = frame.height
        //        let viewWidth = frame.width
        self.previousQuestionButton.setBackgroundImage(previousQBImage, for: UIControlState.normal)
        self.nextQuestionButton.setBackgroundImage(nextQBImage, for: UIControlState.normal)
        self.previousQuestionButton.tag = 0
        self.nextQuestionButton.tag = 1
        self.previousQuestionButton.setTitle("N", for: UIControlState.normal)
        
        self.addSubview(self.previousQuestionButton)
        self.addSubview(self.nextQuestionButton)
    }
    override func draw(_ rect: CGRect) {
        let leftQuestionFrame = CGRect(x: 20, y: 20, width: 200, height: 200)
        let rightQuestionFrame = CGRect(x: 50, y: 20, width: 20, height: 20)
        
        self.previousQuestionButton.frame = leftQuestionFrame
        self.previousQuestionButton.frame = rightQuestionFrame
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
