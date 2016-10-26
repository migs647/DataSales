//
//  ClipRingLayer.m
//  RingGaugeDemo
//
//  Created by Cody Garvin on 10/20/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ClipRingLayer.h"

@implementation ClipRingLayer

- (void)drawInContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);

//    CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
//    CGContextFillRect(ctx, self.bounds);
    

//    [[UIColor greenColor] setFill];
//    CGContextFillRect(UIGraphicsGetCurrentContext(), self.bounds);
    
    // Set up the ring fill color
    UIColor* ringFillColor = [UIColor colorWithRed: 0.636 green: 0.054 blue: 0.11 alpha: 1];
    if (_ringColor) {
        ringFillColor = _ringColor;
    }

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(166.67, 166.51)];
    [bezierPath addCurveToPoint: CGPointMake(163, 166) controlPoint1: CGPointMake(165.55, 166.82) controlPoint2: CGPointMake(163.99, 166.99)];
    [bezierPath addCurveToPoint: CGPointMake(162.58, 162.1) controlPoint1: CGPointMake(161.93, 164.93) controlPoint2: CGPointMake(162.23, 163.22)];
    [bezierPath addCurveToPoint: CGPointMake(171.91, 151.05) controlPoint1: CGPointMake(165.98, 158.68) controlPoint2: CGPointMake(169.09, 154.98)];
    [bezierPath addCurveToPoint: CGPointMake(172, 151) controlPoint1: CGPointMake(171.96, 151.02) controlPoint2: CGPointMake(172, 151)];
    [bezierPath addLineToPoint: CGPointMake(171.95, 151)];
    [bezierPath addCurveToPoint: CGPointMake(189, 98) controlPoint1: CGPointMake(182.67, 136.07) controlPoint2: CGPointMake(189, 117.78)];
    [bezierPath addCurveToPoint: CGPointMake(98, 7) controlPoint1: CGPointMake(189, 47.74) controlPoint2: CGPointMake(148.26, 7)];
    [bezierPath addCurveToPoint: CGPointMake(7, 98) controlPoint1: CGPointMake(47.74, 7) controlPoint2: CGPointMake(7, 47.74)];
    [bezierPath addCurveToPoint: CGPointMake(24.05, 151) controlPoint1: CGPointMake(7, 117.78) controlPoint2: CGPointMake(13.33, 136.07)];
    [bezierPath addLineToPoint: CGPointMake(24, 151)];
    [bezierPath addCurveToPoint: CGPointMake(24.09, 151.05) controlPoint1: CGPointMake(24, 151) controlPoint2: CGPointMake(24.04, 151.02)];
    [bezierPath addCurveToPoint: CGPointMake(33.42, 162.1) controlPoint1: CGPointMake(26.91, 154.98) controlPoint2: CGPointMake(30.02, 158.68)];
    [bezierPath addCurveToPoint: CGPointMake(33, 166) controlPoint1: CGPointMake(33.77, 163.22) controlPoint2: CGPointMake(34.08, 164.93)];
    [bezierPath addCurveToPoint: CGPointMake(29.33, 166.51) controlPoint1: CGPointMake(32.01, 166.99) controlPoint2: CGPointMake(30.45, 166.82)];
    [bezierPath addCurveToPoint: CGPointMake(1, 98) controlPoint1: CGPointMake(11.83, 148.96) controlPoint2: CGPointMake(1, 124.75)];
    [bezierPath addCurveToPoint: CGPointMake(98, 1) controlPoint1: CGPointMake(1, 44.43) controlPoint2: CGPointMake(44.43, 1)];
    [bezierPath addCurveToPoint: CGPointMake(195, 98) controlPoint1: CGPointMake(151.57, 1) controlPoint2: CGPointMake(195, 44.43)];
    [bezierPath addCurveToPoint: CGPointMake(166.67, 166.51) controlPoint1: CGPointMake(195, 124.75) controlPoint2: CGPointMake(184.17, 148.96)];
    [bezierPath closePath];
    
    // We're using an odd number of crossings, use the even odd rule to fill inside
    bezierPath.usesEvenOddFillRule = YES;
    
    [ringFillColor setFill];
    [bezierPath fill];
    
    UIGraphicsPopContext();
}

- (void)setRingColor:(UIColor *)ringColor {
    _ringColor = ringColor;
    [self setNeedsDisplay];
}

@end
