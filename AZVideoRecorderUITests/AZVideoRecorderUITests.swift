//
//  AZVideoRecorderUITests.swift
//  AZVideoRecorderUITests
//
//  Created by abuzeid ibarhim on 10/10/17.
//  Copyright © 2017 Alex Zbirnik. All rights reserved.
//

import XCTest
@testable import AZVideoRecorder

class AZVideoRecorderUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertTrue(XCUIDevice.shared.orientation.isPortrait)
     //let x = CapturedVideosCollectionVC()
    //XCTAssertEqual( DataObserver.observer.videoCounts, DataObserver.observer.capturedArray.count)
    }
    
}
