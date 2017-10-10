//
//  Video.swift
//  VideoRecord
//
//  Created by abuzeid ibarhim on 10/10/17.
//  Copyright © 2017 Alex Zbirnik. All rights reserved.
//

import UIKit

 class Video:NSObject {
    dynamic var thumbnail:UIImage?
    dynamic var url:URL
    init(url:URL) {
        self.url = url
        self.thumbnail = VideoUtils.helper.videoSnapshot(path: self.url.path)
    }

}
