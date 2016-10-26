//
//  PieLayer.m
//  DataSales
//
//  Created by Cody Garvin on 10/19/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import "PieLayer.h"
#import <UIKit/UIKit.h>

@interface PieLayer ()
@property (nonatomic) BOOL isReseting;
@end

@implementation PieLayer

@dynamic startAngle;
@dynamic endAngle;

- (void)drawInContext:(CGContextRef)ctx {
    
    UIGraphicsPushContext(ctx);

    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGFloat radius = MIN(center.x, center.y);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, center.x, center.y);
    
    CGPoint p1 = CGPointMake(center.x + radius * cosf(self.startAngle), center.y + radius * sinf(self.startAngle));
    CGContextAddLineToPoint(ctx, p1.x, p1.y);
    
    int clockwise = self.startAngle > self.endAngle;
    
    CGContextAddArc(ctx, center.x, center.y, radius, self.startAngle, self.endAngle, clockwise);
    
    CGContextSaveGState(ctx);

    // Use white since we're masking
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextDrawPath(ctx, kCGPathFill);
    
    
    UIGraphicsPopContext();
}

- (void)resetToStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle {
    self.isReseting = YES;
    
    self.startAngle = startAngle;
    self.endAngle = endAngle;
    
    self.isReseting = NO;
}

/**
 Returns if the layer should do an implicit animation if the key changes.
 */
- (id<CAAction>)actionForKey:(NSString *)event {
    
    if (!_isReseting) {
        if ([event isEqualToString:@"startAngle"] ||
            [event isEqualToString:@"endAngle"]) {
            return [self makeAnimationForKey:event];
        }
    }
    
    return [super actionForKey:event];
}

- (CABasicAnimation *)makeAnimationForKey:(NSString *)key {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
    
    // set up animation
    animation.fromValue = [[self presentationLayer] valueForKey:key];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 1.5;
    
    return animation;
}

/**
 This is where the magic happens. By watching these keys, CALayer knows to update 
 when they change.
 */
+ (BOOL)needsDisplayForKey:(NSString*)key {
    if (([key isEqualToString:@"startAngle"]) ||
        ([key isEqualToString:@"endAngle"])) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
}

@end
