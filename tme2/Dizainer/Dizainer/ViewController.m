//
//  ViewController.m
//  Dizainer
//
//  Created by m2sar on 03/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) IBOutlet UIStepper *myStepper;
@property (nonatomic, retain) IBOutlet UISlider *myHorizontalSlider;
@property (nonatomic, retain) IBOutlet UISegmentedControl *myUnitsSegment;
@property (nonatomic, retain) IBOutlet UILabel *counterLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *myDecimalSegment;
@property (nonatomic, retain) IBOutlet UILabel *myRazLabel;
@property (nonatomic, retain) IBOutlet UISwitch *mySwitch;
@property (nonatomic, retain) IBOutlet UILabel *geekLabel;
@end

int counter = 0;

@implementation ViewController
- (IBAction)razButtonClicked:(id)sender {
    [self updateView:0];  
}

- (IBAction)mySwithToggleEvent:(id)sender {
    NSString *string;
    if ([_mySwitch isOn]) {
        _geekLabel.text = @"Geek On";
        string = [[[NSString alloc] initWithFormat:@"%x", (int)_myStepper.value] retain];
    } else {
        _geekLabel.text = @"Geek Off";
        string = [[[NSString alloc] initWithFormat:@"%d", (int)_myStepper.value] retain];
    }
    _counterLabel.text = string;
}

- (IBAction)myDecimalChangeEvent:(id)sender {
    [self updateView:(int)_myUnitsSegment.selectedSegmentIndex + (int)_myDecimalSegment.selectedSegmentIndex * 10];
}

- (IBAction)myHorizantalChangeValue:(id)sender {
    [self updateView:(int)_myHorizontalSlider.value];
}

- (IBAction)myUnitsChangeEvent:(id)sender {
    [self updateView:(int)_myUnitsSegment.selectedSegmentIndex + (int)_myDecimalSegment.selectedSegmentIndex * 10];
}

- (void)updateView:(int)value {
    _myStepper.value = value;
    _myHorizontalSlider.value = value;
    _myUnitsSegment.selectedSegmentIndex = (int)_myStepper.value % 10;
    [_myDecimalSegment setSelectedSegmentIndex:(int)_myStepper.value / 10];
    
    NSString *string;
    if ([_mySwitch isOn]) { //Geek Mode On
        string = [[[NSString alloc] initWithFormat:@"%x", (int)_myStepper.value] retain];
    } else {
        string = [[[NSString alloc] initWithFormat:@"%d", (int)_myStepper.value] retain];
    }
    _counterLabel.text = string;

}

- (IBAction)myStepperAction:(id)sender {
    [self updateView:_myStepper.value];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _myStepper.maximumValue = 99;
    _myStepper.minimumValue = 0;
    _myStepper.value = 0;
    
    _myHorizontalSlider.value = 0;
    _myHorizontalSlider.minimumValue = 0;
    _myHorizontalSlider.maximumValue = 99;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
