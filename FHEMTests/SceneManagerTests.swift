//
//  SceneManagerTests.swift
//  FHEM
//
//  Created by Marc Felden on 01.04.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest

@testable import FHEM

class SceneManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testSceneManagerCanAddScene() {
        let scene = Scene(name: "Test", actors:[Actor(name:"ttt")])
        let sut = SceneManager()
        sut.addScene(scene)
        XCTAssertEqual(sut.numberOfScenes, 1)
    }
}

