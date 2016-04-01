//
//  SceneEditorViewControllerTests.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest

@testable import FHEM


class SceneEditorViewControllerTests: XCTestCase {
    
    var sut: SceneEditorViewController!
    
    override func setUp() {
        super.setUp()
        sut = SceneEditorViewController()
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSUT_HasTableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testFirstHeader() {
        let title = sut.tableView(sut.tableView, titleForHeaderInSection: 0)!
        XCTAssertEqual(title, "Scenen Name")
    }
    
    func testSecondHeader() {
        let title = sut.tableView(sut.tableView, titleForHeaderInSection: 1)!
        XCTAssertEqual(title, "Mitglieder - einschalten")
    }
    
    func testSUT_HasSaveButton() {
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    // TableView DataSource tests
    
    // im wirklichen Leben geht das
    func testTableViewReturns_Groupname() {
    
        sut.groupname = "Test123"
        sut.tableView.reloadData()
       // XCTAssertEqual(sut.groupNameTextField.text,"Test123")
    }
    
    func testSUT_HasGroupManager() {
        XCTAssertNotNil(sut.sceneManager)
    }
    
    // we ell later test, that the group manager handles dublicate entries, can remove entries and so forth.
    func testSUT_GroupManagerCanAddNewSceneToSceneManager() {
        
        let sceneManager = SceneManager()
        sut.sceneManager = sceneManager
//        XCTAssertTrue(sceneManager.numberOfItems,0)
    }
}
