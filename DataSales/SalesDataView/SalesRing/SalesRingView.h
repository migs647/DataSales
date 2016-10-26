//
//  SalesRingView.h
//  DataSales
//
//  Created by Cody Garvin on 10/19/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SalesRingViewModel;

/**
 A ring fuel gauge with the ability to be filled up according to sales numbers 
 from the view model. A view model approach was used to keep any calculation
 logic and view deciding factors out of the ring view itself.
 */
@interface SalesRingView : UIView

/** @name Section Properties */

/// The view model that dictates all color, and conversion of business logic
/// to view logic.
@property (nonatomic) SalesRingViewModel *viewModel;

/** @name Section Instance Methods */

/// Convenience initializer to get a view model associated before building the view.
- (instancetype)initWithViewModel:(SalesRingViewModel *)viewModel;

/// Animates the ring gauge to start filling up to the appropriate value
- (void)startRingFill;

/// Resets the gauge back to a state before animation.
- (void)reset;

/// Shows/hides the masks that make the gauge happen. @warning: This is for
/// debugging purposes only!
- (void)toggleMasks;
@end
