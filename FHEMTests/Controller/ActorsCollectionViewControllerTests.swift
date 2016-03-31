//
//  ActorsListViewControllerTests.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest

@testable import FHEM

class ActorsCollectionViewControllerTests:XCTestCase {
    
    var sut:ActorsCollectionViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier("ActorsCollectionViewController") as! ActorsCollectionViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatCollectionViewExists() {

        XCTAssertNotNil(sut.collectionView)
    }
    
     /*
    
    func testSelectionView_HasDataSource() {
        XCTAssertNotNil(sut.collectionView.dataSource)
    }
   
    func testSelectionView_HasDelegate() {
        let contentVC = sut.stackVC[0] as! ContentViewController
        XCTAssertNotNil(contentVC.collectionView.delegate)
    }
 */
    
}
