//
//  SalesRingViewModel.swift
//  DataSales
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
    var dataModel: SalesDataModel {
        didSet {
            setDialPercentageOpen(percentage: dataModel.percentageSold())
        }
    }
    
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

        setDialPercentageOpen(percentage: dataModel.percentageSold())
    }
    
    // MARK: - Functions
        
    /**
     Returns the color of the gauge that should be filled.
     
     - returns The UIColor value that should be used to fill the ring.
     */
    func fillColor() -> UIColor {
        return UIColor(colorLiteralRed: 0.588, green: 0.717, blue: 0.113, alpha: 1.0)
    }

    /**
     Returns the color of the foreground elements.
     
     - returns The UIColor value that should be used to highlight portions of the UI.
     */
    func baseColor() -> UIColor {
        return UIColor(colorLiteralRed: 0.682, green: 0.682, blue: 0.682, alpha:1.0)
    }
    
    /**
     Returns the color of the background, a lighter color than the highlight.
     
     - returns The UIColor value that should be used to make subtle highlights.
     */
    func backgroundColor() -> UIColor {
        return UIColor(colorLiteralRed: 0.933, green: 0.933, blue: 0.933, alpha:1.0)
    }
    
    /**
     The attributed visual string that represents the number of item sold.
     
     - returns An attributed string formatted correctly for display on a label.
     */
    func soldAttributedString() -> NSAttributedString {
        let itemsSold = dataModel.itemsSold
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let tempValue = formatter.string(from: NSNumber(value: itemsSold))
        
        var formattedValue = "0"
        if let _ = tempValue {
            formattedValue = tempValue!
        }

        return NSAttributedString(string: formattedValue,
                                  attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 40),
                                               NSForegroundColorAttributeName: self.fillColor()])
    }

    /**
     The attributed visual string that represents the number of items not sold.
     
     - returns An attributed string formatted correctly for display on a label.
     */
    func unSoldAttributedString() -> NSAttributedString {

        let itemsLeft = dataModel.totalItems - dataModel.itemsSold
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let tempValue = formatter.string(from: NSNumber(value: itemsLeft))

        var formattedValue = "0"
        if let _ = tempValue {
            formattedValue = tempValue!
        }
        
        return NSAttributedString(string: "\(formattedValue)",
            attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 40),
                         NSForegroundColorAttributeName: self.fillColor()])
        
    }
    
    /**
     The attributed visual string that represents the dollar amount of sales total.
     
     - returns An attributed string formatted correctly for display on a label.
     */
    func salesAttributedString() -> NSAttributedString {
        
        let salesValue = dataModel.totalSales
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let tempValue = formatter.string(from: NSNumber(value: salesValue))
        
        var formattedValue = "0"
        if let _ = tempValue {
            formattedValue = tempValue!
        }
        
        return NSAttributedString(string: "\(formattedValue)",
            attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 30),
                         NSForegroundColorAttributeName: self.fillColor()])
        
    }
    
    /**
     The attributed visual string that represents the view all selling button.
     
     - returns An attributed string formatted correctly for display on a button.
     */
    func viewSellingAttributedString() -> NSAttributedString {

        return NSAttributedString(string: NSLocalizedString("View All Selling", comment: "View All Selling"),
            attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12),
                         NSForegroundColorAttributeName: self.baseColor()])
        
        
    }
    
    /**
     The attributed visual string that represents the total days items have been sold.
     
     - returns An attributed string formatted correctly for display on a label.
     */
    func dayTotalAttributedString() -> NSAttributedString {
        
        return NSAttributedString(string: "\(dataModel.days)"+"-"+NSLocalizedString("Day Total", comment: "Day Total"),
                                  attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 13),
                                               NSForegroundColorAttributeName: self.baseColor()])
    }

    
    
    // MARK: - Private Convenience Functions
    
    /// Used to circumvent the didSet not being executed in init
    private func setDialPercentageOpen(percentage: Float) {
        dialPercentageOpen = percentage
    }
}
