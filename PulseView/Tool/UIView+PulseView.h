//
//  UIView+PulseView.h
//  PulseView
//
//  Created by super on 2017/10/29.
//  Copyright © 2017年 super. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YGPulseViewAnimationType) {
    YGPulseViewAnimationTypeRegularPulsing,
    YGPulseViewAnimationTypeRadarPulsing
};

@interface UIView (PulseView)

- (void)startPulseWithColor:(UIColor *)color;

- (void)startPulseWithColor:(UIColor *)color animation:(YGPulseViewAnimationType)animationType;
- (void)startPulseWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius animation:(YGPulseViewAnimationType)animationType;

- (void)startPulseWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius scaleFrom:(CGFloat)initialScale to:(CGFloat)finishScale frequency:(CGFloat)frequency opacity:(CGFloat)opacity animation:(YGPulseViewAnimationType)animationType;

- (void)stopPulse;

@end
