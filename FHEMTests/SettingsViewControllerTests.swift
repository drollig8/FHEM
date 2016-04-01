//
//  SettingsViewControllerTests.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest

@testable import FHEM

class SettingsViewControllerTests: XCTestCase {
    
    var sut: SettingsViewController!
    
    override func setUp() {
        super.setUp()
        sut = SettingsViewController()
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWeHaveCloseButton() {
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func testSUT_HasTableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testSUT_SetsTitle() {
        XCTAssertEqual(sut.title, "Settings")
    }
    
    func testTableViewStyleIs_Grouped() {
        XCTAssertTrue(sut.tableView.style == .Grouped)
    }
    
    func testTableViewHasDatasouce() {
        XCTAssertNotNil(sut.tableView.dataSource)
        }
    
    func testTableViewReturns2Sections() {
        XCTAssertEqual(sut.tableView.numberOfSections, 2)
    }
    
    func testTableViewReturnServerSettingsHeader() {
        XCTAssertEqual(sut.tableView(sut.tableView, titleForHeaderInSection: 0), "Server Settings")
    }
    
    func testTableViewHasSettingsManagber() {
        XCTAssertNotNil(sut.settingsManager)
    }
    
}
