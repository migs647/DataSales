//
//  SalesRingViewModel.swift
//  RingGaugeDemo
//
//  Created by Cody Garvin on 10/20/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

import UIKit

/**
 This view model dictates display logic for the SalesRingView. It helps present 
 the specific views with the correct format and data.
 */
@objc
class SalesRingViewModel: NSObject {
    
    // MARK: - Parameters
    
    /// The sales data model, the heart of this class.
    var dataModel: SalesDataModel
    
    /// The amount to fill the ring in with.
    var degreesToMove: Float = 0
    
    /// The amount on a decimal basis how much the dial should be opened to.
    var dialPercentageOpen: Float = 90 {
        didSet {
            degreesToMove = (360.0 * dialPercentageOpen)
        }
    }
    
    // MARK: - Initializers
    
    /**
     The designated initializer for SalesRingViewModel. The view model is based 
     entirely off of the data model and what it supplies. Make sure to supply 
     a completed data model for full functionality.
     
     - parameter salesDataModel is the data model supplied from services to 
     indicate the sales statistics for a user.
    */
    init(salesDataModel: SalesDataModel) {
        self.dataModel = salesDataModel

        super.init()

        setDialPercentageOpen(percentage: percentageSold())
    }
    
    // MARK: - Functions
    
    /**
     Calculates the percentage of items sold to be used in a visual display 
     that represents total sales.
     
     - returns The total percentage sold out of 100%.
     */
    func percentageSold() -> Float {
        return Float(dataModel.itemsSold) / Float(dataModel.totalItems)
    }
    
    /**
     Returns the color of the gauge that should be filled.
     
     - returns The UIColor value that should be used to fill the ring.
     */
    func colorOfRingFill() -> UIColor {
        return UIColor(colorLiteralRed: 0.588, green: 0.717, blue: 0.113, alpha: 1.0)
    }
    
    
    // MARK: - Private Convenience Functions
    
    /// Used to circumvent the didSet not being executed in init
    private func setDialPercentageOpen(percentage: Float) {
        dialPercentageOpen = percentage
    }
}
