//
//  SalesDataModel.swift
//  RingGaugeDemo
//
//  Created by Cody Garvin on 10/20/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

import UIKit

/**
 SalesDataModel contains the data consistent with a sales event including the 
 total number of items sold and the amount of money the user has generated.
 */
struct SalesDataModel {
    
    /// The number of items that have been sold.
    let itemsSold: Int
    
    /// The total number of items that are for sale.
    let totalItems: Int
    
    /// The number of days the sale has been going on.
    let days: Int
    
    // The current dollar amount of items sold.
    let totalSales: Float
    
}
