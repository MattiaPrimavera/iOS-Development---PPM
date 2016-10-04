//
//  ViewController.swift
//  Couleur-swift
//
//  Created by m2sar on 26/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    var colors = [UIColor!]()
    
    @IBAction func actionStepper(_ sender: AnyObject) {
        if(myStepper.value < 1){
            myStepper.value = 0;
        }
        else if(myStepper.value >= 9){
            myStepper.value = 9;
        }
        
        let newColor = colors[Int(myStepper.value)];
        myLabel.backgroundColor = newColor;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myStepper.maximumValue = 10
        myStepper.minimumValue = 1
        myStepper.value = 0
        
        var hue = 0.0
        let INCREMENT = 0.05
        for _ in 1...10{
            hue += INCREMENT
            let color = UIColor(hue:CGFloat(hue), saturation:1.0, brightness:1.0, alpha:1.0)
            colors.append(color);
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

