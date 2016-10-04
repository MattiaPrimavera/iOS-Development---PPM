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
@end

int counter = 0;

@implementation ViewController
- (IBAction)myStepperAction:(id)sender {
    UIStepper *stepper = (UIStepper *) sender;
    if (stepper){
        NSString *string = [[[NSString alloc] initWithFormat:@"%d", counter] autorelease];
        _counterLabel.text = string;
    }
    else{
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //_myStepper.maximumValue = 99;
    //_myStepper.minimumValue = 0;

    // Do any additional setup after loading the view, typically from a nib.
    //creating mutable array
    // NSArray *items = [[[NSArray alloc] init] autorelease];
    /*NSArray *items = [NSArray array];
    for (int i = 0; i < 10; i++) {
        items = [items arrayByAddingObject:[[NSString alloc] initWithFormat:@"%d", i]];
    }
    _myUnitsSegment = [[UISegmentedControl alloc] initWithItems:items];
    
    NSArray *itemsDecimal = [[NSArray alloc] initWithObjects: @"Red",
                           @"Blue", @"Green", @"Yellow", nil];
    _myDecimalSegment = [[UISegmentedControl alloc] initWithItems:itemsDecimal];*/
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
