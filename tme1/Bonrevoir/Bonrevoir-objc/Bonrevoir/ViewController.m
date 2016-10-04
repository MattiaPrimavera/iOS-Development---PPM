//
//  ViewController.m
//  Bonrevoir
//
//  Created by m2sar on 26/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionButton:(id)sender {
    NSString *buttonText = _myButton.titleLabel.text;
    if([buttonText  isEqual: @"Dis Bonjour"]){
        _myLabel.text = @"Bonjour!!!";
        [_myButton setTitle:@"Dis au Revoir" forState:UIControlStateNormal];
    }
    else if([buttonText  isEqual: @"Dis au Revoir"]){
        _myLabel.text = @"Au Revoir!!!";
        [_myButton setTitle:@"Dis Bonjour" forState:UIControlStateNormal];
    }
}
@end
