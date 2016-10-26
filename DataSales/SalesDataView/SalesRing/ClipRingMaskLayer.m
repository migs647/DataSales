//
//  ClipRingMaskLayer.m
//  DataSales
//
//  Created by Cody Garvin on 10/24/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ClipRingLayer.h"
#import "ClipRingMaskLayer.h"

@implementation ClipRingMaskLayer

- (void)drawInContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);
    
    
    // Set up the ring fill color
    UIColor* ringFillColor = [UIColor blackColor];
    
    // !!!: yes paint code was used here... i am not a freak!
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: [self cgPointScale:27.49 y:31.38]];
    [bezierPath addCurveToPoint: [self cgPointScale:55.95 y:10.59] controlPoint1: [self cgPointScale:35.88 y:22.5] controlPoint2: [self cgPointScale:45.56 y:15.58]];
    [bezierPath addCurveToPoint: [self cgPointScale:56.09 y:10.52] controlPoint1: [self cgPointScale:55.99 y:10.56] controlPoint2: [self cgPointScale:56.04 y:10.54]];
    [bezierPath addCurveToPoint: [self cgPointScale:60.07 y:8.72] controlPoint1: [self cgPointScale:57.41 y:9.89] controlPoint2: [self cgPointScale:58.73 y:9.29]];
    [bezierPath addCurveToPoint: [self cgPointScale:60.86 y:8.4] controlPoint1: [self cgPointScale:60.33 y:8.61] controlPoint2: [self cgPointScale:60.6 y:8.51]];
    [bezierPath addCurveToPoint: [self cgPointScale:64.28 y:7.05] controlPoint1: [self cgPointScale:61.99 y:7.93] controlPoint2: [self cgPointScale:63.13 y:7.47]];
    [bezierPath addCurveToPoint: [self cgPointScale:65.74 y:6.53] controlPoint1: [self cgPointScale:64.76 y:6.87] controlPoint2: [self cgPointScale:65.25 y:6.7]];
    [bezierPath addCurveToPoint: [self cgPointScale:68.58 y:5.57] controlPoint1: [self cgPointScale:66.68 y:6.2] controlPoint2: [self cgPointScale:67.63 y:5.87]];
    [bezierPath addCurveToPoint: [self cgPointScale:70.61 y:4.96] controlPoint1: [self cgPointScale:69.25 y:5.35] controlPoint2: [self cgPointScale:69.93 y:5.16]];
    [bezierPath addCurveToPoint: [self cgPointScale:72.99 y:4.28] controlPoint1: [self cgPointScale:71.4 y:4.73] controlPoint2: [self cgPointScale:72.19 y:4.49]];
    [bezierPath addCurveToPoint: [self cgPointScale:75.41 y:3.68] controlPoint1: [self cgPointScale:73.79 y:4.07] controlPoint2: [self cgPointScale:74.6 y:3.87]];
    [bezierPath addCurveToPoint: [self cgPointScale:77.5 y:3.2] controlPoint1: [self cgPointScale:76.11 y:3.51] controlPoint2: [self cgPointScale:76.8 y:3.35]];
    [bezierPath addCurveToPoint: [self cgPointScale:80.14 y:2.67] controlPoint1: [self cgPointScale:78.38 y:3.01] controlPoint2: [self cgPointScale:79.26 y:2.84]];
    [bezierPath addCurveToPoint: [self cgPointScale:82.13 y:2.32] controlPoint1: [self cgPointScale:80.81 y:2.55] controlPoint2: [self cgPointScale:81.47 y:2.43]];
    [bezierPath addCurveToPoint: [self cgPointScale:84.83 y:1.92] controlPoint1: [self cgPointScale:83.03 y:2.17] controlPoint2: [self cgPointScale:83.93 y:2.04]];
    [bezierPath addCurveToPoint: [self cgPointScale:86.86 y:1.66] controlPoint1: [self cgPointScale:85.51 y:1.83] controlPoint2: [self cgPointScale:86.18 y:1.74]];
    [bezierPath addCurveToPoint: [self cgPointScale:89.52 y:1.39] controlPoint1: [self cgPointScale:87.74 y:1.56] controlPoint2: [self cgPointScale:88.63 y:1.47]];
    [bezierPath addCurveToPoint: [self cgPointScale:91.66 y:1.23] controlPoint1: [self cgPointScale:90.23 y:1.33] controlPoint2: [self cgPointScale:90.95 y:1.28]];
    [bezierPath addCurveToPoint: [self cgPointScale:94.26 y:1.1] controlPoint1: [self cgPointScale:92.53 y:1.17] controlPoint2: [self cgPointScale:93.4 y:1.13]];
    [bezierPath addCurveToPoint: [self cgPointScale:96.48 y:1.04] controlPoint1: [self cgPointScale:95 y:1.07] controlPoint2: [self cgPointScale:95.74 y:1.05]];
    [bezierPath addCurveToPoint: [self cgPointScale:98.03 y:1] controlPoint1: [self cgPointScale:97 y:1.03] controlPoint2: [self cgPointScale:97.51 y:1]];
    [bezierPath addCurveToPoint: [self cgPointScale:99.12 y:1.03] controlPoint1: [self cgPointScale:98.39 y:1] controlPoint2: [self cgPointScale:98.75 y:1.02]];
    [bezierPath addCurveToPoint: [self cgPointScale:101.15 y:1.08] controlPoint1: [self cgPointScale:99.8 y:1.04] controlPoint2: [self cgPointScale:100.47 y:1.06]];
    [bezierPath addCurveToPoint: [self cgPointScale:104.06 y:1.21] controlPoint1: [self cgPointScale:102.12 y:1.11] controlPoint2: [self cgPointScale:103.09 y:1.15]];
    [bezierPath addCurveToPoint: [self cgPointScale:105.57 y:1.32] controlPoint1: [self cgPointScale:104.56 y:1.24] controlPoint2: [self cgPointScale:105.07 y:1.28]];
    [bezierPath addCurveToPoint: [self cgPointScale:108.96 y:1.63] controlPoint1: [self cgPointScale:106.71 y:1.41] controlPoint2: [self cgPointScale:107.84 y:1.5]];
    [bezierPath addCurveToPoint: [self cgPointScale:109.78 y:1.73] controlPoint1: [self cgPointScale:109.24 y:1.66] controlPoint2: [self cgPointScale:109.51 y:1.7]];
    [bezierPath addCurveToPoint: [self cgPointScale:195 y:98.02] controlPoint1: [self cgPointScale:157.79 y:7.54] controlPoint2: [self cgPointScale:195 y:48.42]];
    [bezierPath addCurveToPoint: [self cgPointScale:166.68 y:166.54] controlPoint1: [self cgPointScale:195 y:124.77] controlPoint2: [self cgPointScale:184.18 y:148.99]];
    [bezierPath addCurveToPoint: [self cgPointScale:166.56 y:166.57] controlPoint1: [self cgPointScale:166.64 y:166.55] controlPoint2: [self cgPointScale:166.6 y:166.56]];
    [bezierPath addCurveToPoint: [self cgPointScale:100.82 y:195] controlPoint1: [self cgPointScale:148.42 y:184.75] controlPoint2: [self cgPointScale:124.75 y:194.3]];
    [bezierPath addCurveToPoint: [self cgPointScale:98.5 y:192.11] controlPoint1: [self cgPointScale:99.79 y:194.46] controlPoint2: [self cgPointScale:98.54 y:193.51]];
    [bezierPath addCurveToPoint: [self cgPointScale:100.87 y:188.99] controlPoint1: [self cgPointScale:98.46 y:190.59] controlPoint2: [self cgPointScale:99.85 y:189.56]];
    [bezierPath addCurveToPoint: [self cgPointScale:115.24 y:187.37] controlPoint1: [self cgPointScale:105.69 y:188.84] controlPoint2: [self cgPointScale:110.49 y:188.28]];
    [bezierPath addCurveToPoint: [self cgPointScale:115.34 y:187.39] controlPoint1: [self cgPointScale:115.3 y:187.38] controlPoint2: [self cgPointScale:115.34 y:187.39]];
    [bezierPath addLineToPoint: [self cgPointScale:115.3 y:187.36]];
    [bezierPath addCurveToPoint: [self cgPointScale:164.09 y:160.55] controlPoint1: [self cgPointScale:133.34 y:183.87] controlPoint2: [self cgPointScale:150.5 y:174.92]];
    [bezierPath addCurveToPoint: [self cgPointScale:172.79 y:149.82] controlPoint1: [self cgPointScale:167.3 y:157.14] controlPoint2: [self cgPointScale:170.2 y:153.55]];
    [bezierPath addCurveToPoint: [self cgPointScale:172.89 y:149.67] controlPoint1: [self cgPointScale:172.83 y:149.77] controlPoint2: [self cgPointScale:172.86 y:149.72]];
    [bezierPath addCurveToPoint: [self cgPointScale:160.46 y:31.88] controlPoint1: [self cgPointScale:197.98 y:113.34] controlPoint2: [self cgPointScale:193.53 y:63.15]];
    [bezierPath addCurveToPoint: [self cgPointScale:108.99 y:7.68] controlPoint1: [self cgPointScale:145.76 y:17.97] controlPoint2: [self cgPointScale:127.64 y:9.94]];
    [bezierPath addCurveToPoint: [self cgPointScale:108.31 y:7.6] controlPoint1: [self cgPointScale:108.76 y:7.65] controlPoint2: [self cgPointScale:108.53 y:7.62]];
    [bezierPath addCurveToPoint: [self cgPointScale:105.06 y:7.3] controlPoint1: [self cgPointScale:107.23 y:7.47] controlPoint2: [self cgPointScale:106.14 y:7.38]];
    [bezierPath addCurveToPoint: [self cgPointScale:103.7 y:7.19] controlPoint1: [self cgPointScale:104.61 y:7.26] controlPoint2: [self cgPointScale:104.15 y:7.22]];
    [bezierPath addCurveToPoint: [self cgPointScale:100.93 y:7.07] controlPoint1: [self cgPointScale:102.77 y:7.14] controlPoint2: [self cgPointScale:101.85 y:7.1]];
    [bezierPath addCurveToPoint: [self cgPointScale:99.07 y:7.03] controlPoint1: [self cgPointScale:100.31 y:7.06] controlPoint2: [self cgPointScale:99.69 y:7.03]];
    [bezierPath addCurveToPoint: [self cgPointScale:96.56 y:7.04] controlPoint1: [self cgPointScale:98.23 y:7.02] controlPoint2: [self cgPointScale:97.39 y:7.03]];
    [bezierPath addCurveToPoint: [self cgPointScale:94.5 y:7.09] controlPoint1: [self cgPointScale:95.87 y:7.05] controlPoint2: [self cgPointScale:95.19 y:7.06]];
    [bezierPath addCurveToPoint: [self cgPointScale:92.05 y:7.22] controlPoint1: [self cgPointScale:93.69 y:7.12] controlPoint2: [self cgPointScale:92.87 y:7.17]];
    [bezierPath addCurveToPoint: [self cgPointScale:90.05 y:7.37] controlPoint1: [self cgPointScale:91.38 y:7.26] controlPoint2: [self cgPointScale:90.71 y:7.31]];
    [bezierPath addCurveToPoint: [self cgPointScale:87.55 y:7.62] controlPoint1: [self cgPointScale:89.21 y:7.44] controlPoint2: [self cgPointScale:88.38 y:7.53]];
    [bezierPath addCurveToPoint: [self cgPointScale:85.64 y:7.86] controlPoint1: [self cgPointScale:86.91 y:7.69] controlPoint2: [self cgPointScale:86.27 y:7.78]];
    [bezierPath addCurveToPoint: [self cgPointScale:83.12 y:8.24] controlPoint1: [self cgPointScale:84.8 y:7.98] controlPoint2: [self cgPointScale:83.96 y:8.1]];
    [bezierPath addCurveToPoint: [self cgPointScale:81.23 y:8.57] controlPoint1: [self cgPointScale:82.49 y:8.34] controlPoint2: [self cgPointScale:81.86 y:8.46]];
    [bezierPath addCurveToPoint: [self cgPointScale:78.78 y:9.06] controlPoint1: [self cgPointScale:80.41 y:8.73] controlPoint2: [self cgPointScale:79.6 y:8.89]];
    [bezierPath addCurveToPoint: [self cgPointScale:76.78 y:9.52] controlPoint1: [self cgPointScale:78.11 y:9.2] controlPoint2: [self cgPointScale:77.45 y:9.36]];
    [bezierPath addCurveToPoint: [self cgPointScale:74.55 y:10.08] controlPoint1: [self cgPointScale:76.04 y:9.7] controlPoint2: [self cgPointScale:75.29 y:9.88]];
    [bezierPath addCurveToPoint: [self cgPointScale:72.26 y:10.73] controlPoint1: [self cgPointScale:73.78 y:10.28] controlPoint2: [self cgPointScale:73.02 y:10.5]];
    [bezierPath addCurveToPoint: [self cgPointScale:70.42 y:11.28] controlPoint1: [self cgPointScale:71.65 y:10.91] controlPoint2: [self cgPointScale:71.03 y:11.09]];
    [bezierPath addCurveToPoint: [self cgPointScale:67.68 y:12.21] controlPoint1: [self cgPointScale:69.5 y:11.57] controlPoint2: [self cgPointScale:68.59 y:11.89]];
    [bezierPath addCurveToPoint: [self cgPointScale:66.39 y:12.67] controlPoint1: [self cgPointScale:67.25 y:12.36] controlPoint2: [self cgPointScale:66.81 y:12.51]];
    [bezierPath addCurveToPoint: [self cgPointScale:63.09 y:13.97] controlPoint1: [self cgPointScale:65.28 y:13.08] controlPoint2: [self cgPointScale:64.18 y:13.51]];
    [bezierPath addCurveToPoint: [self cgPointScale:62.44 y:14.23] controlPoint1: [self cgPointScale:62.87 y:14.06] controlPoint2: [self cgPointScale:62.66 y:14.14]];
    [bezierPath addCurveToPoint: [self cgPointScale:58.6 y:15.97] controlPoint1: [self cgPointScale:61.15 y:14.78] controlPoint2: [self cgPointScale:59.87 y:15.36]];
    [bezierPath addCurveToPoint: [self cgPointScale:58.58 y:15.98] controlPoint1: [self cgPointScale:58.6 y:15.97] controlPoint2: [self cgPointScale:58.59 y:15.98]];
    [bezierPath addCurveToPoint: [self cgPointScale:7.05 y:98.02] controlPoint1: [self cgPointScale:28.09 y:30.68] controlPoint2: [self cgPointScale:7.05 y:61.89]];
    [bezierPath addCurveToPoint: [self cgPointScale:24.1 y:151.03] controlPoint1: [self cgPointScale:7.05 y:117.8] controlPoint2: [self cgPointScale:13.38 y:136.1]];
    [bezierPath addLineToPoint: [self cgPointScale:24.05 y:151.03]];
    [bezierPath addCurveToPoint: [self cgPointScale:24.14 y:151.08] controlPoint1: [self cgPointScale:24.05 y:151.03] controlPoint2: [self cgPointScale:24.09 y:151.05]];
    [bezierPath addCurveToPoint: [self cgPointScale:33.46 y:162.13] controlPoint1: [self cgPointScale:26.96 y:155.01] controlPoint2: [self cgPointScale:30.07 y:158.71]];
    [bezierPath addCurveToPoint: [self cgPointScale:33.05 y:166.03] controlPoint1: [self cgPointScale:33.82 y:163.25] controlPoint2: [self cgPointScale:34.12 y:164.96]];
    [bezierPath addCurveToPoint: [self cgPointScale:29.38 y:166.54] controlPoint1: [self cgPointScale:32.05 y:167.03] controlPoint2: [self cgPointScale:30.49 y:166.85]];
    [bezierPath addCurveToPoint: [self cgPointScale:1.12 y:100.78] controlPoint1: [self cgPointScale:12.48 y:149.6] controlPoint2: [self cgPointScale:1.84 y:126.43]];
    [bezierPath addCurveToPoint: [self cgPointScale:1.04 y:100.65] controlPoint1: [self cgPointScale:1.1 y:100.74] controlPoint2: [self cgPointScale:1.06 y:100.69]];
    [bezierPath addCurveToPoint: [self cgPointScale:27.49 y:31.38] controlPoint1: [self cgPointScale:0.37 y:75.86] controlPoint2: [self cgPointScale:9.13 y:50.82]];
    [bezierPath closePath];
    
    // We're using an odd number of crossings y:use the even odd rule to fill inside
    bezierPath.usesEvenOddFillRule = YES;
    
    [ringFillColor setFill];
    [bezierPath fill];
    
    UIGraphicsPopContext();
}

@end
