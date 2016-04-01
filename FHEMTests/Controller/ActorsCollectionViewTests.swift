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
        
        let fakeDataProvider = FakeDataProvider()
        sut.collectionDataProvider = fakeDataProvider
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatCollectionViewExists() {
        XCTAssertNotNil(sut.collectionView)
    }
    
    
    
    func testSelectionView_HasDataSource() {
        XCTAssertNotNil(sut.collectionView.dataSource)
    }
    
 
    func testSelectionView_HasDelegate() {
        XCTAssertNotNil(sut.collectionView.delegate)
    }
    
    func testWeHaveReloadButton()
    {
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func testWeHaveSettingsButton() {
        XCTAssertNotNil(sut.navigationItem.leftBarButtonItem)
    }
    
    func testThatPressingSettingsShowsSettingsViewController() {
        XCTAssertNil(sut.presentedViewController)
        guard let settingsButton = sut.navigationItem.leftBarButtonItem else {XCTFail();return}
    
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        sut.performSelector(settingsButton.action, withObject: settingsButton)
        XCTAssertNotNil(sut.presentedViewController)
        
    }
    
    func testSettingsViewControllerIsInNavigationController() {
        XCTAssertNil(sut.presentedViewController)
        guard let settingsButton = sut.navigationItem.leftBarButtonItem else {XCTFail();return}
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        sut.performSelector(settingsButton.action, withObject: settingsButton)
        XCTAssertTrue(sut.presentedViewController is UINavigationController)
    }

    
}

extension ActorsCollectionViewControllerTests {
    class FakeDataProvider: ActorsDataProvider {
        override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            return UICollectionViewCell()
        }
        
    }
}
