//
//  ClipRingLayer.m
//  DataSales
//
//  Created by Cody Garvin on 10/20/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ClipRingLayer.h"

@implementation ClipRingLayer

- (void)drawInContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);

    // Set up the ring fill color
    UIColor* ringFillColor = [UIColor colorWithRed: 0.636 green: 0.054 blue: 0.11 alpha: 1];
    if (_ringColor) {
        ringFillColor = _ringColor;
    }

    // !!!: yes paint code was used here... i am not a freak!
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: [self cgPointScale:166.67 y:166.51]];
    [bezierPath addCurveToPoint: [self cgPointScale:163 y:166] controlPoint1: [self cgPointScale:165.55 y:166.82] controlPoint2: [self cgPointScale:163.99 y:166.99]];
    [bezierPath addCurveToPoint: [self cgPointScale:162.58 y:162.1] controlPoint1: [self cgPointScale:161.93 y:164.93] controlPoint2: [self cgPointScale:162.23 y:163.22]];
    [bezierPath addCurveToPoint: [self cgPointScale:171.91 y:151.05] controlPoint1: [self cgPointScale:165.98 y:158.68] controlPoint2: [self cgPointScale:169.09 y:154.98]];
    [bezierPath addCurveToPoint: [self cgPointScale:172 y:151] controlPoint1: [self cgPointScale:171.96 y:151.02] controlPoint2: [self cgPointScale:172 y:151]];
    [bezierPath addLineToPoint: [self cgPointScale:171.95 y:151]];
    [bezierPath addCurveToPoint: [self cgPointScale:189 y:98] controlPoint1: [self cgPointScale:182.67 y:136.07] controlPoint2: [self cgPointScale:189 y:117.78]];
    [bezierPath addCurveToPoint: [self cgPointScale:98 y:7] controlPoint1: [self cgPointScale:189 y:47.74] controlPoint2: [self cgPointScale:148.26 y:7]];
    [bezierPath addCurveToPoint: [self cgPointScale:7 y:98] controlPoint1: [self cgPointScale:47.74 y:7] controlPoint2: [self cgPointScale:7 y:47.74]];
    [bezierPath addCurveToPoint: [self cgPointScale:24.05 y:151] controlPoint1: [self cgPointScale:7 y:117.78] controlPoint2: [self cgPointScale:13.33 y:136.07]];
    [bezierPath addLineToPoint: [self cgPointScale:24 y:151]];
    [bezierPath addCurveToPoint: [self cgPointScale:24.09 y:151.05] controlPoint1: [self cgPointScale:24 y:151] controlPoint2: [self cgPointScale:24.04 y:151.02]];
    [bezierPath addCurveToPoint: [self cgPointScale:33.42 y:162.1] controlPoint1: [self cgPointScale:26.91 y:154.98] controlPoint2: [self cgPointScale:30.02 y:158.68]];
    [bezierPath addCurveToPoint: [self cgPointScale:33 y:166] controlPoint1: [self cgPointScale:33.77 y:163.22] controlPoint2: [self cgPointScale:34.08 y:164.93]];
    [bezierPath addCurveToPoint: [self cgPointScale:29.33 y:166.51] controlPoint1: [self cgPointScale:32.01 y:166.99] controlPoint2: [self cgPointScale:30.45 y:166.82]];
    [bezierPath addCurveToPoint: [self cgPointScale:1 y:98] controlPoint1: [self cgPointScale:11.83 y:148.96] controlPoint2: [self cgPointScale:1 y:124.75]];
    [bezierPath addCurveToPoint: [self cgPointScale:98 y:1] controlPoint1: [self cgPointScale:1 y:44.43] controlPoint2: [self cgPointScale:44.43 y:1]];
    [bezierPath addCurveToPoint: [self cgPointScale:195 y:98] controlPoint1: [self cgPointScale:151.57 y:1] controlPoint2: [self cgPointScale:195 y:44.43]];
    [bezierPath addCurveToPoint: [self cgPointScale:166.67 y:166.51] controlPoint1: [self cgPointScale:195 y:124.75] controlPoint2: [self cgPointScale:184.17 y:148.96]];
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

- (CGPoint)cgPointScale:(CGFloat)x y:(CGFloat)y {
    CGFloat setScale = _drawScale > 0 ? _drawScale : 1.0f;
    CGPoint p; p.x = x*setScale; p.y = y*setScale; return p;
}
@end
