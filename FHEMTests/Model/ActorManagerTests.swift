//
//  ActorManager.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest

@testable import FHEM

class ActorManagerTests:XCTestCase {
    
    var sut:ActorManager!
    override func setUp() {
        super.setUp()
        sut = ActorManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func test_actorCanAddActor() {
        sut.addActor(Actor(name: "Test"))
    }
    
    func test_NumberOfActorsCanBeRetrieved() {
        sut.addActor(Actor(name: "Test"))
        sut.addActor(Actor(name: "Test"))
        sut.addActor(Actor(name: "Test"))
        let numberOfActors = sut.numberOfActors
        XCTAssertEqual(numberOfActors, 3)
    }
    
    func test_actorAtIndexReturnsActor() {
        let sut = ActorManager()
        sut.addActor(Actor(name: "testx"))
        sut.addActor(Actor(name: "test0"))
        let actor0 = sut.itemAtIndex(0)
        XCTAssertEqual(actor0.name, "testx")
    }
    
    func test_actorAtIndexCanMadeInvisible() {
        sut.addActor(Actor(name: "testx"))
        sut.addActor(Actor(name: "test0"))
        sut.removeActorAtIndex(0)
        let actor0 = sut.itemAtIndex(0)
        XCTAssertEqual(actor0.visible, false)
    }
}
