//
//  SalesViewModelTests.swift
//  DataSales
//
//  Created by Cody Garvin on 10/26/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

import XCTest
@testable import DataSales

class SalesViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDegreesToMove() {
        
        var dataModel = SalesDataModel(itemsSold: 5, totalItems: 13, days: 15, totalSales: 6.32)
        let viewModel = SalesRingViewModel(salesDataModel: dataModel)
        
        XCTAssert(viewModel.degreesToMove == 136.8, "Degreees to move should be 136.8")

        
        dataModel = SalesDataModel(itemsSold: 13, totalItems: 13, days: 15, totalSales: 6.32)
        viewModel.dataModel = dataModel
        
        XCTAssert(viewModel.degreesToMove == 360, "Degreees to move should be 360")
        
        
        dataModel = SalesDataModel(itemsSold: 13, totalItems: 5, days: 15, totalSales: 6.32)
        viewModel.dataModel = dataModel
        
        XCTAssert(viewModel.degreesToMove == 360, "Degreees to move should be 360")

        dataModel = SalesDataModel(itemsSold: 13, totalItems: 0, days: 15, totalSales: 6.32)
        viewModel.dataModel = dataModel
        
        XCTAssert(viewModel.degreesToMove == 0, "Degreees to move should be 360")

        dataModel = SalesDataModel(itemsSold: 0, totalItems: 5, days: 15, totalSales: 6.32)
        viewModel.dataModel = dataModel
        
        XCTAssert(viewModel.degreesToMove == 0, "Degreees to move should be 0")

    }
    
    func testSoldAttributedString() {
        var dataModel = SalesDataModel(itemsSold: 5, totalItems: 13, days: 15, totalSales: 6.32)
        let viewModel = SalesRingViewModel(salesDataModel: dataModel)
        
        XCTAssert(viewModel.soldAttributedString().string == "5", "Sold string should be 5")

        dataModel = SalesDataModel(itemsSold: 0, totalItems: 5, days: 15, totalSales: 6.32)
        viewModel.dataModel = dataModel
        
        XCTAssert(viewModel.degreesToMove == 0, "Sold string should be 0")

    }
}
