//
//  ViewController.m
//  UIViewAnimtationTest
//
//  Created by 胡金丽 on 2017/2/7.
//  Copyright © 2017年 Tim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewa;
@property (weak, nonatomic) IBOutlet UIView *viewb;
@property (weak, nonatomic) IBOutlet UIView *viewc;

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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self changeFrame];
//    [self flipAni];
//    [self blockAni1];
//    [self blockAni4];
//    [self blockAni5];
//    [self blockAni6];
    [self blockAni7];
}

- (void)blockAni7 {
    UIImageView * newCenterShow = [[UIImageView alloc]initWithFrame:self.viewa.frame];
    
    newCenterShow.backgroundColor = [UIColor lightGrayColor];
    
    [UIView transitionFromView:self.viewa toView:newCenterShow duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}

- (void)blockAni6 {
    [UIView transitionWithView:self.viewa duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{

    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}

- (void)blockAni5 {
//    self.centerShow.image = nil;
    [UIView animateKeyframesWithDuration:9.0 delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:1.0 / 4 animations:^{
            self.viewa.backgroundColor = [UIColor colorWithRed:0.9475 green:0.1921 blue:0.1746 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.viewa.backgroundColor = [UIColor colorWithRed:0.1064 green:0.6052 blue:0.0334 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:2.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.viewa.backgroundColor = [UIColor colorWithRed:0.1366 green:0.3017 blue:0.8411 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:3.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.viewa.backgroundColor = [UIColor colorWithRed:0.619 green:0.037 blue:0.6719 alpha:1.0];
        }];
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}

- (void)blockAni4 {
    [UIView animateWithDuration:1.1 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.viewb.frame = self.viewa.frame;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)blockAni1 {
    [UIView animateWithDuration:1.0 animations:^{
        self.viewb.frame = self.viewa.frame;
    }];
}

- (void)changeFrame {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:3];
    self.viewb.frame = self.viewa.frame;
    [UIView commitAnimations];
}

- (void)flipAni {
    [UIView beginAnimations:@"FlipAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.viewa cache:YES];
    [UIView commitAnimations];
}

- (void)startAni:(NSString *)aniID {
    NSLog(@"%@ start",aniID);
}

- (void)stopAni:(NSString *)aniID {
    NSLog(@"%@ stop",aniID);
}


@end
