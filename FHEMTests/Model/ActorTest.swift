//
//  Actor.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest

@testable import FHEM

class ActorTests:XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_SetsName() {
        let actor = Actor(name:"Test")
        XCTAssertEqual(actor.name, "Test")
    }
    
    func testInit_SetsNameAndState() {
        let actor = Actor(name:"Test", state: "off")
        XCTAssertEqual(actor.state, "off")
    }
    
    func testInit_SetsNameAndStateAndImageName() {
        let actor = Actor(name:"Test", state: "off",imageName: "TestImage")
        XCTAssertEqual(actor.imageName, "TestImage")
    }
    
    func testInit_SetsNameAndStateAndImageNameVisible() {
        let actor = Actor(name:"Test", state: "off",imageName: "TestImage", visible: false)
        XCTAssertEqual(actor.visible, false)
    }
}
