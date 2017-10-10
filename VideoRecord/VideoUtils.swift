//
//  VideoUtils.swift
//  VideoRecord
//
//  Created by abuzeid ibarhim on 10/10/17.
//  Copyright © 2017 Alex Zbirnik. All rights reserved.
//

import UIKit
import  AVFoundation
class VideoUtils: NSObject {
   private override init() {
        
    }
    static let helper = VideoUtils()
    func videoSnapshot(path: String?) -> UIImage? {
        guard let filePathLocal = path else{
            return nil
        }
        let vidURL = URL(fileURLWithPath:filePathLocal as String)
        let asset = AVURLAsset(url:vidURL,options:nil)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        
        let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
        
        do {
            let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)
            return UIImage(cgImage: imageRef)
        }
        catch let error as NSError
        {
            print("Image generation failed with error \(error)")
            return nil
        }
    }
}
