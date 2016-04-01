//
//  SettingsManagerTests.swift
//  myWater
//
//  Created by Marc Felden on 19.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import XCTest
@testable import FHEM

class SettingsManagerTests: XCTestCase {
    
    var sut: SettingsManager!
    
    override func setUp() {
        super.setUp()
        sut = SettingsManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    
    func testAfterFactoryReset_DefaultValuesAreSet() {
        sut.factoryReset()
        XCTAssertEqual(sut.localServerName, "http://raspberrypi")
        XCTAssertEqual(sut.localServerPort, 8083)
        XCTAssertEqual(sut.localServerRequiresAuthentication, false)
        XCTAssertEqual(sut.localServerUsername, nil)
        XCTAssertEqual(sut.localServerPassword, nil)
    }
    
    
  
    func test_ValesGetSaved() {
        
        sut.localServerName = "ABC"
        sut.save()
        sut = nil
        sut = SettingsManager()
        XCTAssertEqual(sut.localServerName, "ABC")

    }


    // später: external Server, und filterParameter
}

