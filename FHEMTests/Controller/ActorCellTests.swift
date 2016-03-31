//
//  ActorCellTests.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//


import XCTest
@testable import FHEM
class ActorCellTests: XCTestCase {
    
    var cell:ActorCell!
    override func setUp() {
        super.setUp()
        cell = ActorCell()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConfigureCell_SetsName() {
        cell.configureCellWithItem(Actor(name: "test333", state: "off", imageName: nil))
        XCTAssertEqual(cell.textLabel.text,"test333")
    }
    
    

    
    
    
    func testConfigureCell_SetsStateImage() {
        cell.configureCellWithItem(Actor(name: "test333", state: "on"))
        let image = UIImage(named: "on")
        XCTAssertEqual(cell.imageView.image,image)
    }
    
    

    
    
    
    // Ist Presentation of View Animated
    // Presentation
    
}
