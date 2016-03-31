//
//  APIClientTests.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//


import XCTest
@testable import FHEM


class APIClientTests: XCTestCase {
    
    override func setUp() {
        if !onelineTests {return}
        super.setUp()
    }
    
    func test_WeGetRealDataAtAll() {
        if !onelineTests {return}
        let sut = APIClient()
        let exp = expectationWithDescription("FHEMInfoReceived")
        
        let urlString = "http://supermanager.noip.me:8083/fhem?cmd=jsonlist2&XHR=1"
        
        sut.getActors(urlString) { (fhemInfos, error) in
            print(error)
            if let fhemInfos = fhemInfos {
                XCTAssertTrue(fhemInfos.count > 83)
                exp.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(3.0, handler: nil)
    }
    
    
    // TODO: We need to use Offline Data
    func test_DetailData() {
        if !onelineTests {return}
        let sut = APIClient()
        let exp = expectationWithDescription("FHEMInfoReceived")
        
        let urlString = "http://supermanager.noip.me:8083/fhem?cmd=jsonlist2&XHR=1"
        
        sut.getActors(urlString) { (fhemInfos, error) in
            print(error)
            if let fhemInfos = fhemInfos {
                XCTAssertTrue(fhemInfos.count > 83)
                let fhemInfo = fhemInfos[8]
                XCTAssertEqual(fhemInfo.name, "DIMMER")
                XCTAssertEqual(fhemInfo.state, "off")
                exp.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(3.0, handler: nil)
    }

    func testWeCanSetDimmerToOn() {
        if !onelineTests {return}

        let sut = APIClient()
        let exp = expectationWithDescription("FHEMTurnedOn")
        let urlString = "http://supermanager.noip.me:8083/fhem?cmd=jsonlist2&XHR=1"
        
        sut.getActors(urlString) { (fhemInfos, error) in
            print(error)
            if let fhemInfos = fhemInfos {
                XCTAssertTrue(fhemInfos.count > 83)
                let fhemDimmer = fhemInfos[8]
                XCTAssertEqual(fhemDimmer.name, "DIMMER")
                XCTAssertEqual(fhemDimmer.state, "off")
                
                sut.turnOn(fhemDimmer, completion: { (result, error) in
                    XCTAssertNil(error)
                })
                exp.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(3.0, handler: nil)
    }

}