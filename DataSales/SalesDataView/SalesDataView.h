//
//  SalesDataView.h
//  DataSales
//
//  Created by Cody Garvin on 10/24/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SalesRingViewModel;

/**
 Delegation for interaction events with the view.
 */
@protocol SalesDataViewDelegate <NSObject>

@optional

/**
 Alerts the delegate that the View All Sales button was tapped.
 
 @param sender The view the tap came from.
 */
- (void)didTapViewAll:(id)sender;

@end

/**
 SalesDataView is a visual graph and representation of the number of items sold 
 vs. the number of items that are left. The total currency value of the sales 
 are displayed along with a day running total. The graph can animate a fill 
 according to the number of items sold to unsold ratio.
 */
@interface SalesDataView : UIView

/// Delegate for interaction events with the view.
@property (nonatomic, weak) id<SalesDataViewDelegate> delegate;

/// Update the view model so we can change the backing data
@property (nonatomic) SalesRingViewModel *viewModel;

/**
 A view model is necessary to drive the UI of this control. Instantiate with a 
 view model is highly recommended. Use the property to change the data later.
 
 @param viewModel The view model that contains view specific logic.
 
 @return An instance of SalesDataView
 */
- (instancetype)initWithViewModel:(SalesRingViewModel *)viewModel;

/**
 Start the animation of the ring being filled according to the sold : unsold ratio.
 */
- (void)startRingFill;
@end
