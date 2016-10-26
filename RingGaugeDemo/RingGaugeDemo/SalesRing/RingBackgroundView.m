//
//  RingBackgroundView.m
//  RingGaugeDemo
//
//  Created by Cody Garvin on 10/21/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import "RingBackgroundView.h"
#import "ClipRingLayer.h"

@interface RingBackgroundView ()
@property (nonatomic, strong) ClipRingLayer *backgroundLayer;
@end

@implementation RingBackgroundView

- (id)init {
    self = [super init];
    if (self) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    // Add the Clip layer as a background layer
    self.backgroundLayer = [ClipRingLayer layer];
    _backgroundLayer.ringColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1.0];
    [self.layer addSublayer:_backgroundLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundLayer.frame = self.layer.bounds;
}

@end
