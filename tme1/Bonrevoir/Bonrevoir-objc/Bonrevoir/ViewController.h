//
//  ViewController.h
//  Bonrevoir
//
//  Created by m2sar on 26/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;

- (IBAction)actionButton:(id)sender;

@end

