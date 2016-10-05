//
//  ViewController.m
//  NuancierRVB
//
//  Created by m2sar on 04/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) IBOutlet UIView *beforeLastView;
@property (nonatomic, retain) IBOutlet UIView *lastView;
@property (nonatomic, retain) IBOutlet UIView *currentView;
@property (nonatomic, retain) IBOutlet UILabel *redLabel;
@property (nonatomic, retain) IBOutlet UILabel *greenLabel;
@property (nonatomic, retain) IBOutlet UILabel *blueLabel;
@property (nonatomic, retain) IBOutlet UISlider *redSlider;
@property (nonatomic, retain) IBOutlet UISlider *blueSlider;
@property (nonatomic, retain) IBOutlet UIButton *storeButton;
@property (nonatomic, retain) IBOutlet UIButton *razButton;
@property (nonatomic, retain) IBOutlet UISlider *greenSlider;
@property (nonatomic, retain) IBOutlet UISwitch *modeSwitch;

@end

@implementation ViewController
- (IBAction)storeButtonClicked:(id)sender {
    _beforeLastView.backgroundColor = _lastView.backgroundColor;
    _lastView.backgroundColor = _currentView.backgroundColor;
}

- (IBAction)redSliderChangeEvent:(id)sender {
    [self updateCurrentViewBackground];
    NSString *string = [NSString stringWithFormat:@"R: %d %%", (int)(_redSlider.value * 100 / 255)];
    _redLabel.text = string;
}

- (IBAction)restoreBeforeLast:(id)sender {
    UIColor* color = _beforeLastView.backgroundColor;
    _currentView.backgroundColor = color;
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    _redSlider.value = (int)red;
    _greenSlider.value = (int)green;
    _blueSlider.value = (int)blue;
}

- (IBAction)restoreLastView:(id)sender {
}


- (IBAction)blueSliderChangeEvent:(id)sender {
    [self updateCurrentViewBackground];
    NSString *string = [NSString stringWithFormat:@"R: %d %%", (int)(_blueSlider.value * 100 / 255)];
    _blueLabel.text = string;
}

- (IBAction)greenSliderChangeEvent:(id)sender {
    [self updateCurrentViewBackground];
    NSString *string = [NSString stringWithFormat:@"R: %d %%", (int)(_blueSlider.value * 100 / 255)];
    _greenLabel.text = string;
}


- (IBAction)switchModeEvent:(id)sender {
}

- (void)updateCurrentViewBackground {
    int red = _redSlider.value;
    int green = _greenSlider.value;
    int blue = _blueSlider.value;
    UIColor *startColor = [UIColor colorWithRed:(red / 255.0) green:((green) / 255.0) blue:((blue) / 255.0) alpha:1.0];
    [_currentView setBackgroundColor:startColor];
}

- (void)loadViewsInitialState {
    _redSlider.minimumValue = 0;
    _redSlider.maximumValue = 255;
    _redSlider.value = 255 / 2;
    _redLabel.text = @"R: 0 %";

    _blueSlider.minimumValue = 0;
    _blueSlider.maximumValue = 255;
    _blueSlider.value = 255 / 2;
    _blueLabel.text = @"B: 0 %";
    
    _greenSlider.minimumValue = 0;
    _greenSlider.maximumValue = 255;
    _greenSlider.value = 255 / 2;
    _greenLabel.text = @"G: 0 %";
    int red = _redSlider.value;
    int green = _greenSlider.value;
    int blue = _blueSlider.value;
    UIColor *startColor = [UIColor colorWithRed:(red / 255.0) green:((green) / 255.0) blue:((blue) / 255.0) alpha:1.0];
    
    [_beforeLastView setBackgroundColor:startColor];
    [_lastView setBackgroundColor:startColor];
    [_currentView setBackgroundColor:startColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadViewsInitialState];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)razButtonClicked:(id)sender {
    [self loadViewsInitialState];
}

@end
