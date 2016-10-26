//
//  SalesRingView.m
//  DataSales
//
//  Created by Cody Garvin on 10/19/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import "DataSales-Swift.h"

#import "SalesRingView.h"
#import "RingBackgroundView.h"
#import "ClipRingLayer.h"
#import "ClipRingMaskLayer.h"
#import "PieLayer.h"

// The starting angle for the start angle for the pie mask layer.
static NSInteger SRVStartDegreesForMask = 125;

// The ending angle for the end angle for the pie mask layer.
static NSInteger SRVEndDegreesForMask = 55;

// Convenience define to quickly convert decimal values to radians since we're
// dealing with circles.
#define degreesToRadians( degrees ) ( ( degrees ) / 180.0 * M_PI )


////////////////////////////////////////////////////////////////////////////////
#pragma mark - SalesRingView Extension
@interface SalesRingView()

/// The background empty ring that gets filled in.
@property (nonatomic) UIView *backgroundRingView;

/// The ring that represents the amount filled in.
@property (nonatomic) ClipRingLayer *coloredRingLayer;

/// The ring that reveals the colored portion as it turns.
@property (nonatomic) ClipRingMaskLayer *maskRingLayer;

/// The pie mask that adjusts along with the maskRingLayer to reveal the
/// maskRingLayer portions as it moves.
@property (nonatomic) PieLayer *subMaskLayer;

/// A container layer for the subMaskLayer and maskRingLayer to keep them contained
/// together.
@property (nonatomic) CALayer *finalMaskLayer;

/// A flag to determine the state of masks being shown or not.
@property (nonatomic, assign) BOOL masksAreOff;

@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - SalesRingView Implementation
@implementation SalesRingView

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.masksAreOff = YES;
        
        [self buildView];
    }
    
    return self;
}

- (instancetype)initWithViewModel:(SalesRingViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        self.masksAreOff = YES;
        
        [self buildView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    
    _subMaskLayer.frame = self.layer.bounds;
    
    /**
     !!!: Note: Adjusting the frames of the layers to match the size of the 
     view layer's bounds adjust the layer size. Since there isn't a layout manager
     for iOS, had to use a scaling method on the drawing of the ring. Would love 
     to discuss this to see if there is another way to do this.
     */
    
    // Adjust all the layer frames so that we can use autolayout with the layers.
    CGFloat scalePercentage = self.bounds.size.width / 196.0f;

    _coloredRingLayer.drawScale = scalePercentage;
    _coloredRingLayer.frame = self.layer.bounds;

    _maskRingLayer.drawScale = scalePercentage;
    _maskRingLayer.frame = self.layer.bounds;    
}

#pragma mark - View Builders and Maintainer methods

- (void)buildView {
    
    ////
    // Add the main background view that will be filled up
    self.backgroundRingView = [[RingBackgroundView alloc] initWithViewModel:_viewModel];
    _backgroundRingView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_backgroundRingView];
    
    ////
    // Add the color ring that will fill up the fuel.
    ClipRingLayer *coloredRing = [ClipRingLayer layer];
    coloredRing.ringColor = [_viewModel fillColor];
    self.coloredRingLayer = coloredRing;
    _coloredRingLayer.needsDisplayOnBoundsChange = YES;

    [self.layer addSublayer:_coloredRingLayer];
    
    ////
    // Add the mask layer
    /*
     Start with the mask. Create a shape layer to cut it into the appropriate shape
     that will be drawing. Lastly, add a sublayer (pie layer) with another mask
     so only the appropriate amount shows.
     */
    
    // Start with the ring mask layer
    ClipRingMaskLayer *maskRing = [ClipRingMaskLayer layer];
    self.maskRingLayer = maskRing;
    _maskRingLayer.needsDisplayOnBoundsChange = YES;
    [self.layer addSublayer:_maskRingLayer];
    [_maskRingLayer setNeedsDisplay]; // force it to draw
    
    
    // Grab the overlay
    _subMaskLayer = [PieLayer layer];
    _subMaskLayer.startAngle = degreesToRadians(SRVStartDegreesForMask);
    _subMaskLayer.endAngle = degreesToRadians(SRVEndDegreesForMask);
    [_subMaskLayer setNeedsDisplay]; // force it to draw
    
    // Start by not showing masks, in a real state. We can always show them
    // for debugging purposes.
    [self p_useMasks];
    
    // Simply add the constraints for the background so it resizes with the parent.
    [self p_buildConstraints];
}

- (void)startRingFill {
    
    // Match this to the value of the UIView animateWithDuration: call
    NSTimeInterval duration = 1.5f;
    
    /*
     Note: The ring mask will spin, and since the subMaskLayer is a sublayer
     it will spin with it. Therefore we only need to adjust the right side of the
     pie as the left side will spin to the correct angle.
     */
    
    // Move the end angle so it stays where it should.
    _subMaskLayer.endAngle = degreesToRadians(90 - _viewModel.degreesToMove);
    
    /*
     Build up the key frames from start to finish so the layer knows a direct
     path to animate. Implicit animations DO NOT WORK as Apple takes path of
     least resistence approach. This means sometimes it would spin clockwise vs.
     counter-clockwise when really it should spin clockwise at all times. This is 
     why a CAKeyframeAnimation was used instead of simply using a CATransaction.
     */
    NSMutableArray* keyFrameValues = [NSMutableArray array];
    [keyFrameValues addObject:[NSNumber numberWithFloat:0.0]];
    [keyFrameValues addObject:[NSNumber numberWithFloat:M_PI * 2.0 * _viewModel.dialPercentageOpen]];
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    [animation setValues:keyFrameValues];
    [animation setValueFunction:[CAValueFunction functionWithName: kCAValueFunctionRotateZ]];
    
    [animation setDuration:duration];
    [animation setCalculationMode:kCAAnimationPaced];
    [animation setTimingFunction: [CAMediaTimingFunction
                                   functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    /*
     Keep the ring in the final resting place of the animation. CAKeyframeAnimation
     resets by default without the below. Also do not remove the animation as
     that will reset it as well.
     */
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [_maskRingLayer addAnimation:animation forKey:nil];
}

- (void)reset {
    
    // Remove the colored portion that is revealed during reset so we don't have
    // any flashing going on, we will add it back in later
    [self.coloredRingLayer removeFromSuperlayer];

    // Remove the Key Frame animations so we can put the mask ring back to
    // the default position
    [_maskRingLayer removeAllAnimations];
    
    // Reset the pie mask to the original points
    [_subMaskLayer resetToStartAngle:degreesToRadians(SRVStartDegreesForMask)
                            endAngle:degreesToRadians(SRVEndDegreesForMask)];
    
    // Dispatch after so we do not have an animating glitch while the mask resets
    // back to default position
    dispatch_after
    (dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)),
     dispatch_get_main_queue(), ^{
        [self.layer addSublayer:_coloredRingLayer];
    });
    
}

- (void)toggleMasks {
    
    if (_masksAreOff) {
        [self p_showMasks];
    } else {
        [self p_useMasks];
    }
    
    self.masksAreOff = !_masksAreOff;
}

#pragma mark - Private Methods

- (void)p_buildConstraints {
    [NSLayoutConstraint
     activateConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"H:|[backgroundRingView]|"
                          options:NSLayoutFormatAlignAllCenterY metrics:nil
                          views:@{@"backgroundRingView":_backgroundRingView}]];
    
    [NSLayoutConstraint
     activateConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|[backgroundRingView]|"
                          options:NSLayoutFormatAlignAllCenterX metrics:nil
                          views:@{@"backgroundRingView":_backgroundRingView}]];
}

- (void)p_showMasks {
    
    self.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5f];
    
    _maskRingLayer.mask = nil;
    _coloredRingLayer.mask = nil;
    
    // Mask the main dial mask with the dynamic mask
    [_maskRingLayer addSublayer:_subMaskLayer];
    
    // Create a container layer for the mask, as to not confuse the main gradient layer
    _finalMaskLayer = [CALayer layer];
    _finalMaskLayer.opaque = NO;
    [_finalMaskLayer addSublayer:_maskRingLayer];
    
    // Finally add the final mask
    [self.coloredRingLayer addSublayer:_finalMaskLayer];
    
    _subMaskLayer.opacity = .5f;
    
}

- (void)p_useMasks {
    self.backgroundColor = [UIColor whiteColor];
    
    [_finalMaskLayer removeFromSuperlayer];
    [_subMaskLayer removeFromSuperlayer];
    _subMaskLayer.opacity = 1.0f;
    
    // Mask the main dial mask with the dynamic mask
    _maskRingLayer.mask = _subMaskLayer;
    
    // Create a container layer for the mask, as to not confuse the main gradient layer
    _finalMaskLayer = [CALayer layer];
    _finalMaskLayer.opaque = NO;
    [_finalMaskLayer addSublayer:_maskRingLayer];
    
    // Finally add the final mask
    self.coloredRingLayer.mask = _finalMaskLayer;
    
}

- (void)setViewModel:(SalesRingViewModel *)viewModel {
    if (_viewModel != viewModel) {
        _viewModel = viewModel;
    }
}
@end
