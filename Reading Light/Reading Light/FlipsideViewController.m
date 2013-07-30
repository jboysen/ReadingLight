//
//  FlipsideViewController.m
//  Reading Light
//
//  Created by Jakob Jakobsen Boysen on 29/07/2013.
//  Copyright (c) 2013 Jakob Jakobsen Boysen. All rights reserved.
//

#import "FlipsideViewController.h"
#import "Brightness.h"

@interface FlipsideViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *switcher;

@property (nonatomic) float currentBrightness;

@end

@implementation FlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.doneButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0], UITextAttributeFont, nil] forState:UIControlStateNormal];
    [self.switcher setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0], UITextAttributeFont, nil] forState:UIControlStateNormal];
    
    self.currentBrightness = [Brightness singleton].current;
}

#define LIGHT_VALUE 1.0

#define ORIGINAL_SEGMENT 0
#define LIGHT_SEGMENT 1

- (void)setCurrentBrightness:(float)currentBrightness
{
    [Brightness singleton].current = currentBrightness;

    self.slider.value = currentBrightness;

    if (currentBrightness == LIGHT_VALUE) {
        self.switcher.selectedSegmentIndex = LIGHT_SEGMENT;
    } else if (currentBrightness == [Brightness singleton].original) {
        self.switcher.selectedSegmentIndex = ORIGINAL_SEGMENT;
    } else {
        self.switcher.selectedSegmentIndex = UISegmentedControlNoSegment;
    }
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)changeBrightness
{
    self.currentBrightness = self.slider.value;
}

- (IBAction)switchClicked
{
    if (self.switcher.selectedSegmentIndex == LIGHT_SEGMENT) {
        self.currentBrightness = LIGHT_VALUE;
    } else {
        self.currentBrightness = [Brightness singleton].original;
    }
}

@end
