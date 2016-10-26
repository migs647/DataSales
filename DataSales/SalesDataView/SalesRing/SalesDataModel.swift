//
//  SalesDataModel.swift
//  DataSales
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
    
    /// The current dollar amount of items sold.
    let totalSales: Double
    
    /**
     Calculate the number of items left to be sold.
     
     - returns The total number of items left in the sale.
     */
    func totalItemsLeft() -> Int {
        
        var finalItemsLeft = totalItems - itemsSold
        if finalItemsLeft < 0 {
            finalItemsLeft = 0
        }
        
        return finalItemsLeft
    }
    
    /**
     Calculates the percentage of items sold to be used in a visual display
     that represents total sales.
     
     - returns The total percentage sold out of 100%.
     */

    func percentageSold() -> Float {
        
        var returnValue: Float = 0
        
        // First check for 0 and bail out to avoid an error
        if totalItems > 0 {
    
            let value = Float(itemsSold) / Float(totalItems)
            let divisor = pow(10.0, Float(2))
            returnValue = round(value * divisor) / divisor
        }
        
        if returnValue > 1 {
            returnValue = 1.0
        }
        
        return returnValue
    }
    
}
