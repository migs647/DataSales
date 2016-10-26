//
//  SalesDataModelTests.swift
//  DataSalesTests
//
//  Created by Cody Garvin on 10/19/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

import XCTest
@testable import DataSales

class DataSalesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTotalItemsLeft() {
        var dataModel = SalesDataModel(itemsSold: 5, totalItems: 13, days: 15, totalSales: 6.32)
        XCTAssert(dataModel.totalItemsLeft() == 8, "Items left should be 8")
        
        dataModel = SalesDataModel(itemsSold: 5, totalItems: 0, days: 15, totalSales: 6.32)
        XCTAssert(dataModel.totalItemsLeft() == 0, "Items left should be 0 since we started with 0 items")
        
        dataModel = SalesDataModel(itemsSold: 5, totalItems: 3, days: 15, totalSales: 6.32)
        XCTAssert(dataModel.totalItemsLeft() == 0, "Items left should be 0 since we started with 0 items")
        
        dataModel = SalesDataModel(itemsSold: 5, totalItems: 5, days: 15, totalSales: 6.32)
        XCTAssert(dataModel.totalItemsLeft() == 0, "Items left should be 0 since we started with 0 items")
    }
    
    func testPercentageSold() {
        var dataModel = SalesDataModel(itemsSold: 5, totalItems: 13, days: 15, totalSales: 6.32)
        XCTAssert(dataModel.percentageSold() == 0.38, "Percentage of items sold should be .38")
        
        dataModel = SalesDataModel(itemsSold: 5, totalItems: 0, days: 15, totalSales: 6.32)
        XCTAssert(dataModel.percentageSold() == 0, "Percentage of items sold should be 0")
        
        dataModel = SalesDataModel(itemsSold: 6, totalItems: 5, days: 15, totalSales: 6.32)
        XCTAssert(dataModel.percentageSold() == 1, "Percentage of items sold should be 1")

        
        dataModel = SalesDataModel(itemsSold: 5, totalItems: 5, days: 15, totalSales: 6.32)
        XCTAssert(dataModel.percentageSold() == 1, "Percentage of items sold should be 1")
        
    }
    
}
