//
//  ModelTests.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest

@testable import FHEM

class ModelTest:XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_InitName() {
        let fhem = FHEMInfo(name: "Test")
        XCTAssertEqual(fhem.name, "Test")
    }
    
    func test_InitNameAndState() {
        let fhem = FHEMInfo(name: "Test", state: "off")
        XCTAssertEqual(fhem.state, "off")
    }
}
