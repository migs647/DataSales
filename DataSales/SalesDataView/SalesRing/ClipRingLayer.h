//
//  ClipRingLayer.h
//  DataSales
//
//  Created by Cody Garvin on 10/20/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface ClipRingLayer : CALayer

/// The color the ring should be filled with.
@property (nonatomic) UIColor *ringColor;

/// The scale the layer drawing should be scaled to.
@property (nonatomic) CGFloat drawScale;

/**
 Scale a point using the drawScale property.
 Note: Could have used associated objects and category here instead of 
 aggregation, but felt this would be cleaner to read for now.
 */
- (CGPoint)cgPointScale:(CGFloat)x y:(CGFloat)y;
@end
