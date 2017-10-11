//
//  RecordingContainerController.swift
//  AZVideoRecorder
//
//  Created by abuzeid ibarhim on 10/11/17.
//  Copyright © 2017 Alex Zbirnik. All rights reserved.
//

import UIKit
import AVFoundation
class RecordingContainerController: UIViewController {
    
    @IBOutlet weak var recorderLayout: UIView!
    @IBOutlet weak var videosLayout: UIView!
    @IBOutlet weak var playerLayout: UIView!
    
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    lazy var  videosController:CapturedVideosCollectionVC = {
        let vc:CapturedVideosCollectionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "videos_vc") as! CapturedVideosCollectionVC
        vc.delegate  = self
        
        return vc;
    }()
    
    lazy var  playerController:VideoPlayerController = {
        let vc:VideoPlayerController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "video_player_vc") as! VideoPlayerController
        return vc;
    }()
    
    lazy var  recoderController:RecorderViewController = {
        let vc:RecorderViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "recorder_vc") as! RecorderViewController
        return vc;
    }()
    
    
    
    let mem = AppMemento.myapp
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let y = CGFloat( 64)
        let margin = CGFloat(20)
        self.videosController.view.frame = CGRect(x: margin, y: y, width:  UIScreen.main.bounds.width / 5, height:  UIScreen.main.bounds.height - (margin + y))
        
        
        
        self.addChildViewController(playerController)
        self.addChildViewController(videosController)
        self.addChildViewController(recoderController)
        playerController.view.frame = playerLayout.bounds
        self.playerLayout.addSubview(playerController.view)
        
        videosController.view.frame = videosLayout.bounds
        self.videosLayout.addSubview(videosController.view)
        self.recoderController.view.frame = recorderLayout.bounds
        self.recorderLayout.addSubview(recoderController.view)
        
        
        self.addObserver(self, forKeyPath: #keyPath(mem.state), options: [.initial,.new], context: nil)
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(mem.state) {
            switch AppMemento.myapp.state{
            case AppStates.cancelCurrentStory:
                self.playerLayout.isHidden = true
                self.recorderLayout.isHidden = false
                DataObserver.observer.videoCounts = 0
                 self.optionsView.isHidden = true
            case AppStates.recordingNow:
                self.playerLayout.isHidden = true
                self.recorderLayout.isHidden = false
                self.optionsView.isHidden = true
            case AppStates.recordingStopped:
                self.playerLayout.isHidden = false
                self.recorderLayout.isHidden = true
                self.optionsView.isHidden = false
                playVideo(index: 0)
            default:
                print("no a")
                self.optionsView.isHidden = true

            }
        }
    }
    
    @IBOutlet weak var optionsView: UIView!
}
extension RecordingContainerController : TalkToParentDelegate{
    
    func addPlayerController(){
        playerController.view.frame = self.view.frame
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        self.view.sendSubview(toBack: playerController.view)
    }
    func play(index: Int) {
        
        playVideo(index: index)
    }
    func playVideo(index:Int){
        if self.childViewControllers.contains(playerController){
            self.playerController.view.isHidden = false
            
        }else{
            addPlayerController()
        }
        DataObserver.observer.play(player: playerController, index:index)
    }
    
    @IBAction func cancelStoryAction(_ sender: Any) {
        AppMemento.myapp.state = AppStates.cancelCurrentStory
    }
    
    @IBAction func sendStoryAction(_ sender: Any) {
//        AppMemento.myapp.state = AppStates.cancelCurrentStory

    }
    
}
