//
//  ThemeMusic.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/28/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit
import AVFoundation

class ThemeMusic: UIView {
    
    static var instance: ThemeMusic!
    
    var soundFileNameURL: NSURL = NSURL()
    var soundFileName = ""
    var soundPlay = AVAudioPlayer()
    
    func playSound (soundFile: String, extensionType: String, playFor: Int){
        
        ThemeMusic.instance = self
        
        soundFileName = soundFile
        soundFileNameURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: soundFile, ofType: extensionType)!)
        do{
            try soundPlay = AVAudioPlayer(contentsOf: soundFileNameURL as URL)
        } catch {
            print(error)
        }
        
        
        soundPlay.prepareToPlay()
        if playFor == -1{
            soundPlay.numberOfLoops = -1
        }
        soundPlay.play()
    }
}

/*
 ----------------------------------------------------------------------------------
 | Description: add an image to fit the view in viewDidLoad()                     |
 ----------------------------------------------------------------------------------
 UIGraphicsBeginImageContext(self.view.frame.size)
 UIImage(named: "mia.jpg")?.draw(in: self.view.bounds)
 let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
 UIGraphicsEndImageContext()
 self.view.backgroundColor = UIColor(patternImage: image)
 ----------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------
 
 ----------------------------------------------------------------------------------
 | Description: add a video with a .mp4 extension to background                   |
 ----------------------------------------------------------------------------------
 import AVFoundation
 
 Goes outside any function:
 var avPlayer: AVPlayer!
 var avPlayerLayer: AVPlayerLayer!
 var paused: Bool = false
 
 Goes indide the viewDidLoad:
 let theURL = Bundle.main.url(forResource:"emoji", withExtension: "mp4")
 avPlayer = AVPlayer(url: theURL!)
 avPlayerLayer = AVPlayerLayer(player: avPlayer)
 avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
 avPlayer.volume = 0
 avPlayer.actionAtItemEnd = .none
 avPlayerLayer.frame = view.layer.bounds
 view.backgroundColor = .clear
 view.layer.insertSublayer(avPlayerLayer, at: 0)
 NotificationCenter.default.addObserver(self,
    selector: #selector(playerItemDidReachEnd(notification:)),
    name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
    object: avPlayer.currentItem)
 
 Add these 3 funcs below the viewDidLoad() function:
 @objc func playerItemDidReachEnd(notification: Notification) {
 let p: AVPlayerItem = notification.object as! AVPlayerItem
 p.seek(to: kCMTimeZero)
 }
 
 override func viewDidAppear(_ animated: Bool) {
 super.viewDidAppear(animated)
 avPlayer.play()
 paused = false
 }
 
 override func viewDidDisappear(_ animated: Bool) {
 super.viewDidDisappear(animated)
 avPlayer.pause()
 paused = true
 }
 ----------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------
 
 */












