//
//  SAPreLoader.m
//  PreLoader
//
//  Created by Shai Amar on 5/28/14.
//  Copyright (c) 2014 Shadow. All rights reserved.
//

#import "SAPreLoader.h"

@implementation SAPreLoader

+ (void) startPreLoaderAnimation:(UIView *)preloader
{
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         preloader.alpha = 1.0;
                         [self runSpinAnimationOnView:preloader duration:1.0 rotations:1.0 repeat:400.0];
                         
                     }
                     completion:nil];

}

+ (void) stopPreLoaderAnimation:(UIView *)preloader
{
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         preloader.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         if(finished)
                         {
                             [preloader.layer removeAnimationForKey:@"rotationAnimation"];
                         }
                     }];

}

+ (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


@end
