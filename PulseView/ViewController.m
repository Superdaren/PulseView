//
//  ViewController.m
//  PulseView
//
//  Created by super on 2017/10/29.
//  Copyright © 2017年 super. All rights reserved.
//

#import "ViewController.h"
#import "UIView+PulseView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    [btn1 setTitle:@"哈哈" forState:UIControlStateNormal];
    btn1.layer.cornerRadius = 25;
    btn1.backgroundColor = [UIColor greenColor];
    [btn1 startPulseWithColor:[UIColor greenColor] animation:YGPulseViewAnimationTypeRegularPulsing];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    [btn2 setTitle:@"哈哈" forState:UIControlStateNormal];
    btn2.layer.cornerRadius = 25;
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 startPulseWithColor:[UIColor greenColor] animation:YGPulseViewAnimationTypeRadarPulsing];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
