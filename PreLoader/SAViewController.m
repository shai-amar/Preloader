//
//  SAViewController.m
//  PreLoader
//
//  Created by Shai Amar on 5/28/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import "SAViewController.h"

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

- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


- (IBAction)startPressed:(UIButton *)sender
{
    NSLog(@"Start button pressed");
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.indicator.alpha = 1.0;
                         [self runSpinAnimationOnView:self.indicator duration:1.0 rotations:1.0 repeat:400.0];
                         
                     }
                     completion:^(BOOL finished){
                     }];
}

- (IBAction)stopButtonPressed:(UIButton *)sender
{
    NSLog(@"Stop button pressed");
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.indicator.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         if(finished)
                         {
                             [self.indicator.layer removeAnimationForKey:@"rotationAnimation"];
                         }
                     }];
}

@end
