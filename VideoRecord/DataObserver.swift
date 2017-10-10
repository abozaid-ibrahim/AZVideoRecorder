//
//  DataObserver.swift
//  VideoRecord
//
//  Created by abuzeid ibarhim on 10/9/17.
//  Copyright © 2017 Alex Zbirnik. All rights reserved.
//

import UIKit

final class DataObserver: NSObject {
    private override init() {
        
    }
    
    public static let observer = DataObserver()
    
    
    dynamic var capturedArray = [Video]()
    
    @objc var videoCounts = 0{
        
        didSet{
            if videoCounts == 0{
                self.capturedArray.removeAll()
            }
        }
    }
    @objc func newVideoCaptured(url:Video){
        self.videoCounts += 1
        self.capturedArray.append(url)
    }
    
    
}

