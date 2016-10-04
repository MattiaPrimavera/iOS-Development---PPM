//
//  ViewController.m
//  Couleur
//
//  Created by m2sar on 26/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
    NSMutableArray *colors;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _myStepper.maximumValue = 10;
    _myStepper.minimumValue = 1;
    _myStepper.value = 0;
    
    colors = [NSMutableArray array];
    float INCREMENT = 0.05;
    int count = 10;
    for (float hue = 0.0; hue < 1.0; hue += INCREMENT) {
        if(count == 0)
            break;
        count--;
        UIColor *color = [UIColor colorWithHue:hue
                                    saturation:1.0
                                    brightness:1.0
                                         alpha:1.0];
        [colors addObject:color];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionStepper:(id)sender {
    if(_myStepper.value < 1)
        _myStepper = 0;
    else if(_myStepper.value >= 9)
        _myStepper.value = 9;
    
    UIColor *newColor = [colors objectAtIndex:_myStepper.value];
    _myLabel.backgroundColor = newColor;
    //(int) *value = _myStepper.value;
    //NSLog(@"ValueArray @value");
}




@end
