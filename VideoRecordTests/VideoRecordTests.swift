//
//  VideoRecordTests.swift
//  VideoRecordTests
//
//  Created by abuzeid ibarhim on 10/9/17.
//  Copyright © 2017 Alex Zbirnik. All rights reserved.
//

import XCTest
@testable import AZVideoRecorder

class VideoRecordTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCapturedVideosCount() {
        //check if recorded count == captured collectio count
        XCTAssertEqual(DataObserver.observer.capturedArray.count, DataObserver.observer.videoCounts)
    }
    func testEX(){
        
    }
    
    func testPerformanceExample() {
        self.measure {
            
        }
    }
    
}
