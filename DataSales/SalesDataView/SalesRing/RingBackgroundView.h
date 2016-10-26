//
//  RingBackgroundView.h
//  DataSales
//
//  Created by Cody Garvin on 10/21/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SalesRingViewModel;

@interface RingBackgroundView : UIView

@property (nonatomic) SalesRingViewModel *viewModel;

- (instancetype)initWithViewModel:(SalesRingViewModel *)viewModel;

@end
