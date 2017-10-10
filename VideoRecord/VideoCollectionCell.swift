//
//  VideoCollectionCell.swift
//  VideoRecord
//
//  Created by abuzeid ibarhim on 10/9/17.
//  Copyright © 2017 Alex Zbirnik. All rights reserved.
//

import UIKit

class VideoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var videoiv: UIImageView!
    func setupUI(){
        self.videoiv.layer.cornerRadius = 10
        self.videoiv.layer.borderColor = UIColor.white.cgColor
        self.videoiv.layer.borderWidth = 1
        self.videoiv.layer.masksToBounds = true
    }
}
