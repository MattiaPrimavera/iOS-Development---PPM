//
//  ViewController.swift
//  Bonrevoir-swift
//
//  Created by m2sar on 26/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.textAlignment = .center
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionButton(_ sender: AnyObject){
        if(myButton.titleLabel?.text?.isEqual("Dis Bonjour"))!{
            myLabel.text = "Bonjour!!!"
            myButton.setTitle("Dis au Revoir", for: .normal)
        }else if(myButton.titleLabel?.text?.isEqual("Dis au Revoir"))!{
            myLabel.text = "Au Revoir!!!"
            myButton.setTitle("Dis Bonjour", for: .normal)
        }
    }

}

