//
//  SceneTests.swift
//  FHEM
//
//  Created by Marc Felden on 01.04.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest

@testable import FHEM

class SceneTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testSceneTakesNameAndActors() {
        let scene = Scene(name: "Test", actors:[Actor(name:"ttt")])
        XCTAssertEqual(scene.actors.count, 1)
    }
}
