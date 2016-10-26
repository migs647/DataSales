//
//  RingBackgroundView.m
//  DataSales
//
//  Created by Cody Garvin on 10/21/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import "DataSales-Swift.h"

#import "RingBackgroundView.h"
#import "ClipRingLayer.h"

@interface RingBackgroundView ()
@property (nonatomic) ClipRingLayer *backgroundLayer;
@end

@implementation RingBackgroundView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self buildView];
    }
    
    return self;
}

- (instancetype)initWithViewModel:(SalesRingViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    // Add the Clip layer as a background layer
    self.backgroundLayer = [ClipRingLayer layer];
//    self.backgroundLayer.needsDisplayOnBoundsChange = YES;
    _backgroundLayer.ringColor = [_viewModel backgroundColor];
    [self.layer addSublayer:_backgroundLayer];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat scalePercentage = self.bounds.size.width / 196.0f;
    _backgroundLayer.drawScale = scalePercentage;
    
    self.backgroundLayer.frame = self.layer.bounds;
}

@end
