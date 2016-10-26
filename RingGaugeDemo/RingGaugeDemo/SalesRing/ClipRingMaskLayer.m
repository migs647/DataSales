//
//  ClipRingMaskLayer.m
//  RingGaugeDemo
//
//  Created by Cody Garvin on 10/24/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ClipRingMaskLayer.h"

@implementation ClipRingMaskLayer

- (void)drawInContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);
    
    
    // Set up the ring fill color
    UIColor* ringFillColor = [UIColor blackColor];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(27.49, 31.38)];
    [bezierPath addCurveToPoint: CGPointMake(55.95, 10.59) controlPoint1: CGPointMake(35.88, 22.5) controlPoint2: CGPointMake(45.56, 15.58)];
    [bezierPath addCurveToPoint: CGPointMake(56.09, 10.52) controlPoint1: CGPointMake(55.99, 10.56) controlPoint2: CGPointMake(56.04, 10.54)];
    [bezierPath addCurveToPoint: CGPointMake(60.07, 8.72) controlPoint1: CGPointMake(57.41, 9.89) controlPoint2: CGPointMake(58.73, 9.29)];
    [bezierPath addCurveToPoint: CGPointMake(60.86, 8.4) controlPoint1: CGPointMake(60.33, 8.61) controlPoint2: CGPointMake(60.6, 8.51)];
    [bezierPath addCurveToPoint: CGPointMake(64.28, 7.05) controlPoint1: CGPointMake(61.99, 7.93) controlPoint2: CGPointMake(63.13, 7.47)];
    [bezierPath addCurveToPoint: CGPointMake(65.74, 6.53) controlPoint1: CGPointMake(64.76, 6.87) controlPoint2: CGPointMake(65.25, 6.7)];
    [bezierPath addCurveToPoint: CGPointMake(68.58, 5.57) controlPoint1: CGPointMake(66.68, 6.2) controlPoint2: CGPointMake(67.63, 5.87)];
    [bezierPath addCurveToPoint: CGPointMake(70.61, 4.96) controlPoint1: CGPointMake(69.25, 5.35) controlPoint2: CGPointMake(69.93, 5.16)];
    [bezierPath addCurveToPoint: CGPointMake(72.99, 4.28) controlPoint1: CGPointMake(71.4, 4.73) controlPoint2: CGPointMake(72.19, 4.49)];
    [bezierPath addCurveToPoint: CGPointMake(75.41, 3.68) controlPoint1: CGPointMake(73.79, 4.07) controlPoint2: CGPointMake(74.6, 3.87)];
    [bezierPath addCurveToPoint: CGPointMake(77.5, 3.2) controlPoint1: CGPointMake(76.11, 3.51) controlPoint2: CGPointMake(76.8, 3.35)];
    [bezierPath addCurveToPoint: CGPointMake(80.14, 2.67) controlPoint1: CGPointMake(78.38, 3.01) controlPoint2: CGPointMake(79.26, 2.84)];
    [bezierPath addCurveToPoint: CGPointMake(82.13, 2.32) controlPoint1: CGPointMake(80.81, 2.55) controlPoint2: CGPointMake(81.47, 2.43)];
    [bezierPath addCurveToPoint: CGPointMake(84.83, 1.92) controlPoint1: CGPointMake(83.03, 2.17) controlPoint2: CGPointMake(83.93, 2.04)];
    [bezierPath addCurveToPoint: CGPointMake(86.86, 1.66) controlPoint1: CGPointMake(85.51, 1.83) controlPoint2: CGPointMake(86.18, 1.74)];
    [bezierPath addCurveToPoint: CGPointMake(89.52, 1.39) controlPoint1: CGPointMake(87.74, 1.56) controlPoint2: CGPointMake(88.63, 1.47)];
    [bezierPath addCurveToPoint: CGPointMake(91.66, 1.23) controlPoint1: CGPointMake(90.23, 1.33) controlPoint2: CGPointMake(90.95, 1.28)];
    [bezierPath addCurveToPoint: CGPointMake(94.26, 1.1) controlPoint1: CGPointMake(92.53, 1.17) controlPoint2: CGPointMake(93.4, 1.13)];
    [bezierPath addCurveToPoint: CGPointMake(96.48, 1.04) controlPoint1: CGPointMake(95, 1.07) controlPoint2: CGPointMake(95.74, 1.05)];
    [bezierPath addCurveToPoint: CGPointMake(98.03, 1) controlPoint1: CGPointMake(97, 1.03) controlPoint2: CGPointMake(97.51, 1)];
    [bezierPath addCurveToPoint: CGPointMake(99.12, 1.03) controlPoint1: CGPointMake(98.39, 1) controlPoint2: CGPointMake(98.75, 1.02)];
    [bezierPath addCurveToPoint: CGPointMake(101.15, 1.08) controlPoint1: CGPointMake(99.8, 1.04) controlPoint2: CGPointMake(100.47, 1.06)];
    [bezierPath addCurveToPoint: CGPointMake(104.06, 1.21) controlPoint1: CGPointMake(102.12, 1.11) controlPoint2: CGPointMake(103.09, 1.15)];
    [bezierPath addCurveToPoint: CGPointMake(105.57, 1.32) controlPoint1: CGPointMake(104.56, 1.24) controlPoint2: CGPointMake(105.07, 1.28)];
    [bezierPath addCurveToPoint: CGPointMake(108.96, 1.63) controlPoint1: CGPointMake(106.71, 1.41) controlPoint2: CGPointMake(107.84, 1.5)];
    [bezierPath addCurveToPoint: CGPointMake(109.78, 1.73) controlPoint1: CGPointMake(109.24, 1.66) controlPoint2: CGPointMake(109.51, 1.7)];
    [bezierPath addCurveToPoint: CGPointMake(195, 98.02) controlPoint1: CGPointMake(157.79, 7.54) controlPoint2: CGPointMake(195, 48.42)];
    [bezierPath addCurveToPoint: CGPointMake(166.68, 166.54) controlPoint1: CGPointMake(195, 124.77) controlPoint2: CGPointMake(184.18, 148.99)];
    [bezierPath addCurveToPoint: CGPointMake(166.56, 166.57) controlPoint1: CGPointMake(166.64, 166.55) controlPoint2: CGPointMake(166.6, 166.56)];
    [bezierPath addCurveToPoint: CGPointMake(100.82, 195) controlPoint1: CGPointMake(148.42, 184.75) controlPoint2: CGPointMake(124.75, 194.3)];
    [bezierPath addCurveToPoint: CGPointMake(98.5, 192.11) controlPoint1: CGPointMake(99.79, 194.46) controlPoint2: CGPointMake(98.54, 193.51)];
    [bezierPath addCurveToPoint: CGPointMake(100.87, 188.99) controlPoint1: CGPointMake(98.46, 190.59) controlPoint2: CGPointMake(99.85, 189.56)];
    [bezierPath addCurveToPoint: CGPointMake(115.24, 187.37) controlPoint1: CGPointMake(105.69, 188.84) controlPoint2: CGPointMake(110.49, 188.28)];
    [bezierPath addCurveToPoint: CGPointMake(115.34, 187.39) controlPoint1: CGPointMake(115.3, 187.38) controlPoint2: CGPointMake(115.34, 187.39)];
    [bezierPath addLineToPoint: CGPointMake(115.3, 187.36)];
    [bezierPath addCurveToPoint: CGPointMake(164.09, 160.55) controlPoint1: CGPointMake(133.34, 183.87) controlPoint2: CGPointMake(150.5, 174.92)];
    [bezierPath addCurveToPoint: CGPointMake(172.79, 149.82) controlPoint1: CGPointMake(167.3, 157.14) controlPoint2: CGPointMake(170.2, 153.55)];
    [bezierPath addCurveToPoint: CGPointMake(172.89, 149.67) controlPoint1: CGPointMake(172.83, 149.77) controlPoint2: CGPointMake(172.86, 149.72)];
    [bezierPath addCurveToPoint: CGPointMake(160.46, 31.88) controlPoint1: CGPointMake(197.98, 113.34) controlPoint2: CGPointMake(193.53, 63.15)];
    [bezierPath addCurveToPoint: CGPointMake(108.99, 7.68) controlPoint1: CGPointMake(145.76, 17.97) controlPoint2: CGPointMake(127.64, 9.94)];
    [bezierPath addCurveToPoint: CGPointMake(108.31, 7.6) controlPoint1: CGPointMake(108.76, 7.65) controlPoint2: CGPointMake(108.53, 7.62)];
    [bezierPath addCurveToPoint: CGPointMake(105.06, 7.3) controlPoint1: CGPointMake(107.23, 7.47) controlPoint2: CGPointMake(106.14, 7.38)];
    [bezierPath addCurveToPoint: CGPointMake(103.7, 7.19) controlPoint1: CGPointMake(104.61, 7.26) controlPoint2: CGPointMake(104.15, 7.22)];
    [bezierPath addCurveToPoint: CGPointMake(100.93, 7.07) controlPoint1: CGPointMake(102.77, 7.14) controlPoint2: CGPointMake(101.85, 7.1)];
    [bezierPath addCurveToPoint: CGPointMake(99.07, 7.03) controlPoint1: CGPointMake(100.31, 7.06) controlPoint2: CGPointMake(99.69, 7.03)];
    [bezierPath addCurveToPoint: CGPointMake(96.56, 7.04) controlPoint1: CGPointMake(98.23, 7.02) controlPoint2: CGPointMake(97.39, 7.03)];
    [bezierPath addCurveToPoint: CGPointMake(94.5, 7.09) controlPoint1: CGPointMake(95.87, 7.05) controlPoint2: CGPointMake(95.19, 7.06)];
    [bezierPath addCurveToPoint: CGPointMake(92.05, 7.22) controlPoint1: CGPointMake(93.69, 7.12) controlPoint2: CGPointMake(92.87, 7.17)];
    [bezierPath addCurveToPoint: CGPointMake(90.05, 7.37) controlPoint1: CGPointMake(91.38, 7.26) controlPoint2: CGPointMake(90.71, 7.31)];
    [bezierPath addCurveToPoint: CGPointMake(87.55, 7.62) controlPoint1: CGPointMake(89.21, 7.44) controlPoint2: CGPointMake(88.38, 7.53)];
    [bezierPath addCurveToPoint: CGPointMake(85.64, 7.86) controlPoint1: CGPointMake(86.91, 7.69) controlPoint2: CGPointMake(86.27, 7.78)];
    [bezierPath addCurveToPoint: CGPointMake(83.12, 8.24) controlPoint1: CGPointMake(84.8, 7.98) controlPoint2: CGPointMake(83.96, 8.1)];
    [bezierPath addCurveToPoint: CGPointMake(81.23, 8.57) controlPoint1: CGPointMake(82.49, 8.34) controlPoint2: CGPointMake(81.86, 8.46)];
    [bezierPath addCurveToPoint: CGPointMake(78.78, 9.06) controlPoint1: CGPointMake(80.41, 8.73) controlPoint2: CGPointMake(79.6, 8.89)];
    [bezierPath addCurveToPoint: CGPointMake(76.78, 9.52) controlPoint1: CGPointMake(78.11, 9.2) controlPoint2: CGPointMake(77.45, 9.36)];
    [bezierPath addCurveToPoint: CGPointMake(74.55, 10.08) controlPoint1: CGPointMake(76.04, 9.7) controlPoint2: CGPointMake(75.29, 9.88)];
    [bezierPath addCurveToPoint: CGPointMake(72.26, 10.73) controlPoint1: CGPointMake(73.78, 10.28) controlPoint2: CGPointMake(73.02, 10.5)];
    [bezierPath addCurveToPoint: CGPointMake(70.42, 11.28) controlPoint1: CGPointMake(71.65, 10.91) controlPoint2: CGPointMake(71.03, 11.09)];
    [bezierPath addCurveToPoint: CGPointMake(67.68, 12.21) controlPoint1: CGPointMake(69.5, 11.57) controlPoint2: CGPointMake(68.59, 11.89)];
    [bezierPath addCurveToPoint: CGPointMake(66.39, 12.67) controlPoint1: CGPointMake(67.25, 12.36) controlPoint2: CGPointMake(66.81, 12.51)];
    [bezierPath addCurveToPoint: CGPointMake(63.09, 13.97) controlPoint1: CGPointMake(65.28, 13.08) controlPoint2: CGPointMake(64.18, 13.51)];
    [bezierPath addCurveToPoint: CGPointMake(62.44, 14.23) controlPoint1: CGPointMake(62.87, 14.06) controlPoint2: CGPointMake(62.66, 14.14)];
    [bezierPath addCurveToPoint: CGPointMake(58.6, 15.97) controlPoint1: CGPointMake(61.15, 14.78) controlPoint2: CGPointMake(59.87, 15.36)];
    [bezierPath addCurveToPoint: CGPointMake(58.58, 15.98) controlPoint1: CGPointMake(58.6, 15.97) controlPoint2: CGPointMake(58.59, 15.98)];
    [bezierPath addCurveToPoint: CGPointMake(7.05, 98.02) controlPoint1: CGPointMake(28.09, 30.68) controlPoint2: CGPointMake(7.05, 61.89)];
    [bezierPath addCurveToPoint: CGPointMake(24.1, 151.03) controlPoint1: CGPointMake(7.05, 117.8) controlPoint2: CGPointMake(13.38, 136.1)];
    [bezierPath addLineToPoint: CGPointMake(24.05, 151.03)];
    [bezierPath addCurveToPoint: CGPointMake(24.14, 151.08) controlPoint1: CGPointMake(24.05, 151.03) controlPoint2: CGPointMake(24.09, 151.05)];
    [bezierPath addCurveToPoint: CGPointMake(33.46, 162.13) controlPoint1: CGPointMake(26.96, 155.01) controlPoint2: CGPointMake(30.07, 158.71)];
    [bezierPath addCurveToPoint: CGPointMake(33.05, 166.03) controlPoint1: CGPointMake(33.82, 163.25) controlPoint2: CGPointMake(34.12, 164.96)];
    [bezierPath addCurveToPoint: CGPointMake(29.38, 166.54) controlPoint1: CGPointMake(32.05, 167.03) controlPoint2: CGPointMake(30.49, 166.85)];
    [bezierPath addCurveToPoint: CGPointMake(1.12, 100.78) controlPoint1: CGPointMake(12.48, 149.6) controlPoint2: CGPointMake(1.84, 126.43)];
    [bezierPath addCurveToPoint: CGPointMake(1.04, 100.65) controlPoint1: CGPointMake(1.1, 100.74) controlPoint2: CGPointMake(1.06, 100.69)];
    [bezierPath addCurveToPoint: CGPointMake(27.49, 31.38) controlPoint1: CGPointMake(0.37, 75.86) controlPoint2: CGPointMake(9.13, 50.82)];
    [bezierPath closePath];
    
    // We're using an odd number of crossings, use the even odd rule to fill inside
    bezierPath.usesEvenOddFillRule = YES;
    
    [ringFillColor setFill];
    [bezierPath fill];
    
    UIGraphicsPopContext();
}

@end
