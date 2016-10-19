//
//  ViewController.swift
//  Dizainer-swift
//
//  Created by sultano on 07/10/16.
//  Copyright © 2016 sultano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var modeSwitcher: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var razButton: UIButton!

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var unitsSegment: UISegmentedControl!
    @IBOutlet weak var decimalSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.maximumValue = 99
        stepper.minimumValue = 0
        stepper.value = 0
                
        slider.minimumValue = 0
        slider.maximumValue = 99
        slider.value = 99 / 2
        
        numberLabel.text = String(format: "%d", Int(stepper.value))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onStepperClicked(_ sender: AnyObject) {
        self.updateMainView()
    }
    
    func updateMainView(){
        slider.value = Float(stepper.value)
        unitsSegment.selectedSegmentIndex = Int(stepper.value.truncatingRemainder(dividingBy: 10.0))
        decimalSegment.selectedSegmentIndex = Int(stepper.value / 10)
        
        if(modeSwitcher.isOn){
            numberLabel.text = String(format: "%x", Int(stepper.value))
        }else{
            numberLabel.text = String(format: "%d", Int(stepper.value))
        }
        
        if(stepper.value == 42){
            numberLabel.textColor = UIColor.red
        }else{
            numberLabel.textColor = UIColor.black
        }
    }

    @IBAction func onSwitchClicked(_ sender: AnyObject) {
        self.updateMainView()
    }

    @IBAction func onSegmentClicked(_ sender: AnyObject) {
        stepper.value = Double(decimalSegment.selectedSegmentIndex * 10 + unitsSegment.selectedSegmentIndex)
        self.updateMainView()
    }
    
    @IBAction func onSliderClicked(_ sender: AnyObject) {
        stepper.value = Double(slider.value)
        self.updateMainView()
    }
    
    @IBAction func onRazButtonClicked(_ sender: AnyObject) {
        stepper.value = 0
        self.updateMainView()
    }
}

