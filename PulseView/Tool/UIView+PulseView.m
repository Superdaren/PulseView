//
//  UIView+PulseView.m
//  PulseView
//
//  Created by super on 2017/10/29.
//  Copyright © 2017年 super. All rights reserved.
//

#import "UIView+PulseView.h"

NSString *const YGPulseKey = @"YGPulseKey";
NSString *const YGRadarKey = @"YGRadarKey";
NSString *const YGLayerName = @"YGLayerName";

@implementation UIView (PulseView)


- (void)startPulseWithColor:(UIColor *)color {
    [self startPulseWithColor:color cornerRadius:self.layer.cornerRadius scaleFrom:1.2f to:1.4f frequency:1.0f opacity:0.7f animation:YGPulseViewAnimationTypeRegularPulsing];
}

- (void)startPulseWithColor:(UIColor *)color animation:(YGPulseViewAnimationType)animationType {
    CGFloat frequency = animationType == YGPulseViewAnimationTypeRadarPulsing ? 1.5f : 1.0f;
    CGFloat startScale = animationType == YGPulseViewAnimationTypeRadarPulsing ? 1.0f : 1.2f;
    [self startPulseWithColor:color cornerRadius:self.layer.cornerRadius scaleFrom:startScale to:1.4f frequency:frequency opacity:0.7f animation:animationType];
}

- (void)startPulseWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius animation:(YGPulseViewAnimationType)animationType {
    CGFloat frequency = animationType == YGPulseViewAnimationTypeRadarPulsing ? 1.5f : 1.0f;
    CGFloat startScale = animationType == YGPulseViewAnimationTypeRadarPulsing ? 1.0f : 1.2f;
    [self startPulseWithColor:color cornerRadius:cornerRadius scaleFrom:startScale to:1.5f frequency:frequency opacity:0.7f animation:animationType];
}

- (void)startPulseWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius scaleFrom:(CGFloat)initialScale to:(CGFloat)finishScale frequency:(CGFloat)frequency opacity:(CGFloat)opacity animation:(YGPulseViewAnimationType)animationType {
    CALayer *externalBorder = [CALayer layer];
    externalBorder.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    externalBorder.cornerRadius = cornerRadius;
    externalBorder.backgroundColor = color.CGColor;
    externalBorder.opacity = opacity;
    externalBorder.name = YGLayerName;
    self.layer.masksToBounds = NO;
    [self.layer insertSublayer:externalBorder below:self.layer];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(initialScale);
    scaleAnimation.toValue = @(finishScale);
    scaleAnimation.duration = frequency;
    scaleAnimation.autoreverses = animationType == YGPulseViewAnimationTypeRegularPulsing;
    scaleAnimation.repeatCount = INT32_MAX;
    [externalBorder addAnimation:scaleAnimation forKey:YGPulseKey];
    
    if (animationType == YGPulseViewAnimationTypeRadarPulsing) {
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @(opacity);
        opacityAnimation.toValue = @(0.0);
        opacityAnimation.duration = frequency;
        opacityAnimation.autoreverses = NO;
        opacityAnimation.repeatCount = INT32_MAX;
        [externalBorder addAnimation:opacityAnimation forKey:YGRadarKey];
    }
}

- (void)stopPulse {
    CALayer *externalBorderLayer = [self externalBorderLayer];
    [externalBorderLayer removeAnimationForKey:YGPulseKey];
    [externalBorderLayer removeAnimationForKey:YGRadarKey];
    if (externalBorderLayer) {
        [externalBorderLayer removeFromSuperlayer];
    }
}

- (CALayer *)externalBorderLayer {
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer.name isEqualToString:YGLayerName]) {
            return layer;
        }
    }
    return nil;
}

@end
