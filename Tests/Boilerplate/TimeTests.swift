//
//  TimeTests.swift
//  Boilerplate
//
//  Created by Yegor Popovych on 3/24/16.
//  Copyright © 2016 Crossroad Labs, LTD. All rights reserved.
//

import XCTest
import Foundation

@testable import Boilerplate

class TimeTests : XCTestCase {
    
    func testTimeoutDouble() {
        let to1 = Timeout(timeout: -1.0)
        XCTAssert((to1.timeInterval - 0.00001 < 0) && (to1.timeInterval + 0.00001 > 0)) // is 0 for double
        
        let to2 = Timeout(timeout: 0)
        XCTAssert((to2.timeInterval - 0.00001 < 0) && (to2.timeInterval + 0.00001 > 0)) // is 0 for double
        
        let to3 = Timeout(timeout: Double.infinity)
        XCTAssertEqual(to3.timeInterval, Double.infinity)
        
        let to4 = Timeout(timeout: 100.0)
        XCTAssert((to4.timeInterval - 0.00001 < 100) && (to4.timeInterval + 0.00001 > 100)) // is 100 for double
        
        let to5 = Timeout.Infinity
        XCTAssertEqual(to5.timeInterval, Double.infinity)
        
        let to6 = Timeout.Immediate
        XCTAssert((to6.timeInterval - 0.00001 < 0) && (to6.timeInterval + 0.00001 > 0)) // is 0 for double
        
        let to7 = Timeout.In(timeout: 100)
        XCTAssert((to7.timeInterval - 0.00001 < 100) && (to7.timeInterval + 0.00001 > 100)) // is 100 for double
        
        XCTAssertEqual(Timeout.In(timeout: 0).timeInterval, Timeout.Immediate.timeInterval)
    }
    
}