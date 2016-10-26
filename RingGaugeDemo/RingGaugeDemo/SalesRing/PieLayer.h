//
//  PieLayer.h
//  RingGaugeDemo
//
//  Created by Cody Garvin on 10/19/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface PieLayer : CALayer

@property (nonatomic) CGFloat startAngle;
@property (nonatomic) CGFloat endAngle;

- (void)resetToStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle;

@end
