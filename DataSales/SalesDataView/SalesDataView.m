//
//  SalesDataView.m
//  DataSales
//
//  Created by Cody Garvin on 10/24/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

#import "DataSales-Swift.h"

#import "SalesDataView.h"
#import "SalesRingView.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - SalesDataView Extension
@interface SalesDataView ()

@property (nonatomic) UIView *containerView;

@property (nonatomic) UILabel *titleLabel;

@property (nonatomic) UIView *leftDataContainerView;
@property (nonatomic) UILabel *soldLabel;
@property (nonatomic) UILabel *soldTitleLabel;

@property (nonatomic) UIView *horizontalLine;

@property (nonatomic) UILabel *unSoldLabel;
@property (nonatomic) UILabel *unSoldTitleLabel;

@property (nonatomic) UIView *rightDataContainerView;
@property (nonatomic) SalesRingView *salesRingView;

@property (nonatomic) UILabel *salesTotalLabel;
@property (nonatomic) UILabel *daysOnSaleLabel;

@property (nonatomic) UIButton *viewAllButton;

@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - SalesDataView Implementation
@implementation SalesDataView

#pragma mark - Initializers

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

#pragma mark - View Builders and Maintainer methods

/// Collapse me
- (void)buildView {
    
    // Start with the background color set to gray
    self.backgroundColor = [_viewModel backgroundColor];
    
    // Container view
    self.containerView = [[UIView alloc] init];
    _containerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_containerView];
    
    // Start with the title
    self.titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.text = NSLocalizedString(@"Selling Overview", nil);
    _titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [_containerView addSubview:_titleLabel];
    
    // Build the left container view for all of the sold / unsold data
    self.leftDataContainerView = [[UIView alloc] init];
    [_containerView addSubview:_leftDataContainerView];
    
    // Build the right container view for the fuel gauge
    self.rightDataContainerView = [[UIView alloc] init];
    [_containerView addSubview:_rightDataContainerView];
    
    // Build the sold label
    self.soldLabel = [[UILabel alloc] init];
    _soldLabel.textAlignment = NSTextAlignmentCenter;
    _soldLabel.adjustsFontSizeToFitWidth = YES;
    [_leftDataContainerView addSubview:_soldLabel];
    
    // Build the sold title label
    self.soldTitleLabel = [[UILabel alloc] init];
    _soldTitleLabel.font = [UIFont systemFontOfSize:13.0f];
    _soldTitleLabel.textAlignment = NSTextAlignmentCenter;
    _soldTitleLabel.textColor = [_viewModel baseColor];
    _soldTitleLabel.text = NSLocalizedString(@"Sold", nil);
    [_leftDataContainerView addSubview:_soldTitleLabel];
    
    // Build the horizontal line
    self.horizontalLine = [[UIView alloc] init];
    _horizontalLine.backgroundColor = [_viewModel backgroundColor];
    [_leftDataContainerView addSubview:_horizontalLine];
    
    // Build the unsold label
    self.unSoldLabel = [[UILabel alloc] init];
    _unSoldLabel.textAlignment = NSTextAlignmentCenter;
    _unSoldLabel.adjustsFontSizeToFitWidth = YES;
    [_leftDataContainerView addSubview:_unSoldLabel];
    
    // Build the unsold title label
    self.unSoldTitleLabel = [[UILabel alloc] init];
    _unSoldTitleLabel.font = [UIFont systemFontOfSize:13.0f];
    _unSoldTitleLabel.textAlignment = NSTextAlignmentCenter;
    _unSoldTitleLabel.textColor = [_viewModel baseColor];
    _unSoldTitleLabel.text = NSLocalizedString(@"Unsold", nil);
    [_leftDataContainerView addSubview:_unSoldTitleLabel];
    
    // Add the sales ring to get this party started
    self.salesRingView = [[SalesRingView alloc] initWithViewModel:_viewModel];
    [_rightDataContainerView addSubview:_salesRingView];
    
    // Build the sales total label
    self.salesTotalLabel = [[UILabel alloc] init];
    _salesTotalLabel.adjustsFontSizeToFitWidth = YES;
    _salesTotalLabel.textAlignment = NSTextAlignmentCenter;
    [_rightDataContainerView addSubview:_salesTotalLabel];
    
    // Build the days on sale label
    self.daysOnSaleLabel = [[UILabel alloc] init];
    _daysOnSaleLabel.textAlignment = NSTextAlignmentCenter;
    [_rightDataContainerView addSubview:_daysOnSaleLabel];
    
    self.viewAllButton = [[UIButton alloc] init];
    [_viewAllButton addTarget:self action:@selector(p_viewAllTapped)
             forControlEvents:UIControlEventTouchUpInside];
    [_viewAllButton setAttributedTitle:[_viewModel viewSellingAttributedString] forState:UIControlStateNormal];
    [_viewAllButton setBackgroundColor:[_viewModel backgroundColor]];
    _viewAllButton.layer.borderColor = [_viewModel baseColor].CGColor;
    _viewAllButton.layer.borderWidth = 1.0f;
    _viewAllButton.layer.cornerRadius = 4.0f;
    [_containerView addSubview:_viewAllButton];
    
    [self p_updateLabels];
}

/// Collapse me
- (void)buildConstraints {

    // Set up the main view
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                             options:NSLayoutFormatAlignAllCenterY
                                             metrics:nil views:@{@"view": self}]];
    
    [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual toItem:self
                                 attribute:NSLayoutAttributeWidth multiplier:1.0
                                  constant:0].active = YES;
    
    
    // Set up the container view
    _containerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(8)-[containerView]-8-|"
                                             options:NSLayoutFormatAlignAllCenterY
                                             metrics:nil
                                               views:@{@"containerView": _containerView}]];
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(8)-[containerView]-8-|"
                                             options:NSLayoutFormatAlignAllCenterY
                                             metrics:nil
                                               views:@{@"containerView": _containerView}]];
    
    
    // Set up the title label
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(16)-[titleLabel(>=120)]"
                                             options:NSLayoutFormatAlignAllTop
                                             metrics:nil views:@{@"titleLabel":_titleLabel}]];
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(16)-[titleLabel(>=20)]"
                                             options:NSLayoutFormatAlignAllLeft
                                             metrics:nil views:@{@"titleLabel":_titleLabel}]];
    
    
    // Set up the left container view
    _leftDataContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    _rightDataContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(16)-[leftContainer]-(16)-[rightContainer]-(16)-|"
                                             options:NSLayoutFormatAlignAllTop
                                             metrics:nil
                                               views:@{@"leftContainer":_leftDataContainerView,
                                                       @"rightContainer": _rightDataContainerView}]];
    
    // Set the the vertical positioning of the containers
    [NSLayoutConstraint constraintWithItem:_leftDataContainerView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual toItem:_titleLabel
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0 constant:16.0].active = YES;
    
    // Set the width of the right container
    [NSLayoutConstraint constraintWithItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual toItem:self
                                 attribute:NSLayoutAttributeWidth multiplier:0.66
                                  constant:0].active = YES;
    
    
    // Set the height of the containers
    [NSLayoutConstraint constraintWithItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeWidth multiplier:1.0
                                  constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_leftDataContainerView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeHeight multiplier:1.0
                                  constant:0].active = YES;
    
    
    // Set the sold label
    _soldLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _soldTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _horizontalLine.translatesAutoresizingMaskIntoConstraints = NO;
    _unSoldLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _unSoldTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(16)-[soldLabel(>=20)]-(4)-[soldTitleLabel(>=18)]-(18)-[horizontalLine(==1)]-(18)-[unSoldLabel(>=20)]-(4)-[unSoldTitleLabel(>=18)]"
                                             options:NSLayoutFormatAlignAllCenterX metrics:nil
                                               views:@{@"soldLabel":_soldLabel,
                                                       @"soldTitleLabel": _soldTitleLabel,
                                                       @"horizontalLine": _horizontalLine,
                                                       @"unSoldLabel": _unSoldLabel,
                                                       @"unSoldTitleLabel": _unSoldTitleLabel}]];
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(8)-[soldLabel(>=20)]-(8)-|"
                                             options:0 metrics:nil
                                               views:@{@"soldLabel": _soldLabel}]];
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(8)-[unSoldLabel(>=20)]-(8)-|"
                                             options:0 metrics:nil
                                               views:@{@"unSoldLabel": _unSoldLabel}]];

    
    // Set the horizontal line
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(8)-[horizontalLine]-(8)-|"
                                             options:0 metrics:nil
                                               views:@{@"horizontalLine":_horizontalLine}]];
    
    
    // Set the constraints for the sales ring
    _salesRingView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[salesRingView]|"
                                             options:NSLayoutFormatAlignAllTop
                                             metrics:nil
                                               views:@{@"salesRingView":_salesRingView}]];
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[salesRingView]|"
                                             options:NSLayoutFormatAlignAllTop
                                             metrics:nil
                                               views:@{@"salesRingView":_salesRingView}]];
    
    
    // Set the sales total label
    _salesTotalLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:_salesTotalLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeWidth
                                multiplier:0.66f constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_salesTotalLabel
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeHeight
                                multiplier:0.15f constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_salesTotalLabel
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_salesTotalLabel
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:0.84f constant:0].active = YES;
    
    
    // Set the sales total title label
    _daysOnSaleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:_daysOnSaleLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeWidth
                                multiplier:0.66f constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_daysOnSaleLabel
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0f constant:15.0f].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_daysOnSaleLabel
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_rightDataContainerView
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_daysOnSaleLabel
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_salesTotalLabel
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0f constant:8.0f].active = YES;
    
    
    // Set the view all button
    _viewAllButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(16)-[viewAllButton]-(16)-|"
                                             options:NSLayoutFormatAlignAllTop
                                             metrics:nil views:@{@"viewAllButton":_viewAllButton}]];
    
    [NSLayoutConstraint activateConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[viewAllButton(>=30)]-(16)-|"
                                             options:NSLayoutFormatAlignAllLeft
                                             metrics:nil views:@{@"viewAllButton":_viewAllButton}]];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // Set up all the autolayout constraints
    [self buildConstraints];
}

#pragma mark - Public Methods

- (void)startRingFill {
    [_salesRingView startRingFill];
}

#pragma mark - Private Methods

- (void)p_viewAllTapped {
    
    // Let the delegate know they are viewing all, cause duh.
    // Check for responding to selector since it is optional
    if (_delegate && [_delegate respondsToSelector:@selector(didTapViewAll:)]) {
        [_delegate didTapViewAll:self];
    }
}

- (void)p_updateLabels {
    _soldLabel.attributedText = [_viewModel soldAttributedString];
    _unSoldLabel.attributedText = [_viewModel unSoldAttributedString];
    _salesTotalLabel.attributedText = [_viewModel salesAttributedString];
    _daysOnSaleLabel.attributedText = [_viewModel dayTotalAttributedString];
}

- (void)setViewModel:(SalesRingViewModel *)viewModel {
    if (_viewModel != viewModel) {
        _viewModel = viewModel;
        
        [_salesRingView reset];
        _salesRingView.viewModel = viewModel;
        
        [self p_updateLabels];
    }
}

@end
