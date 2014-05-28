//
//  SAViewController.m
//  PreLoader
//
//  Created by Shai Amar on 5/28/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import "SAViewController.h"
#import "SAPreLoader.h"

@interface SAViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *indicator;


@end

@implementation SAViewController

@synthesize indicator = _indicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)startPressed:(UIButton *)sender
{
    NSLog(@"Start button pressed");
    [SAPreLoader startPreLoaderAnimation:self.indicator];
}

- (IBAction)stopButtonPressed:(UIButton *)sender
{
    NSLog(@"Stop button pressed");
    [SAPreLoader stopPreLoaderAnimation:self.indicator];
}

@end
