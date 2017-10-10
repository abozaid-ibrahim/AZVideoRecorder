//
//  CapturedVideosCollectionVC.swift
//  VideoRecord
//
//  Created by abuzeid ibarhim on 10/9/17.
//  Copyright © 2017 Alex Zbirnik. All rights reserved.
//

import UIKit

class CapturedVideosCollectionVC: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let kvo = DataObserver.observer
    
    var dataSource = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.addObserver(self, forKeyPath: #keyPath(kvo.capturedArray), options: [ .new], context: nil)

    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(kvo.capturedArray) {
            guard let change = change else{
                return
            }
            guard let video = change.first else{
                return
            }
            
            if let obj = video.value as? [Video]{
                for v in obj{
                    if !self.dataSource.contains(v){
                        self.dataSource.append(v)
                        animateNewItem()
                    }
                    
                }

            }
        }
    }
    func animateNewItem(){
        let newIndex  = IndexPath(item:self.dataSource.count - 1,section:0)
        self.collectionView.insertItems(at: [newIndex])
        self.collectionView.scrollToItem(at: newIndex, at: .top, animated: true)
        
        self.collectionView.performBatchUpdates({
            let cell = self.collectionView.cellForItem(at: newIndex)
          
            cell?.frame.origin.y += 100
            UIView.animate(withDuration: TimeInterval(0.5), delay: 0.0, options: [.curveEaseIn], animations: {
                cell?.frame.origin.y -= 100
            }, completion: nil)
        }, completion: nil)
    }
    deinit {
        self.removeObserver(self, forKeyPath: #keyPath(kvo.capturedArray))
    }

}
extension CapturedVideosCollectionVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCollectionCell
        cell.setupUI()
        cell.videoiv.image = dataSource[indexPath.row].thumbnail
        return cell
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.width * 1.3)
    }
    
    
    
    
    
    
}

extension CapturedVideosCollectionVC:UICollectionViewDelegate{
    
    
}
