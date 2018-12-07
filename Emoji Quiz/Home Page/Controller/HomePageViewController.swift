//
//  ViewController.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 3/31/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit
import AVFoundation

class HomePageViewController: UIViewController{
        
    let music = ThemeMusic()
    let backgroundSound = "backgroundSound"
    let backgroundSoundExtension = "mp3"
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    var timer = Timer()
    var timeLeft: Double = 100
    let randomEmoji = ["☺️", "😀", "😃", "😄", "🤯", "😰", "😡","🤫", "😤", "🤑", "🤠", "😎", "🤪", "😍", "😁"]
    
    @objc func gameTimeStart() {
        emojiLabel.text = "EM\(randomEmoji[Int(arc4random_uniform(UInt32(randomEmoji.count)))])JI\nQUIZ"
    }
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "chalkduster", size: 100)
        label.text = "EM🤪JI\nQUIZ"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "chalkduster", size: 38)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(HomePageViewController.startButtonTouched), for: .touchUpInside)
        button.layer.cornerRadius = 30
        return button
    }()
    
    @objc func startButtonTouched() {
        let startbuttontouchedViewController = StartButtonTouchedViewController()
        show(startbuttontouchedViewController, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HomePageViewController.gameTimeStart), userInfo: nil, repeats: true)
        playBackgroundVideo()
        
        music.playSound(soundFile: backgroundSound, extensionType: backgroundSoundExtension, playFor: -1)
        setUpLayout()
    }
    
    func playBackgroundVideo(){
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
    }
    
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
        timer.invalidate()
    }
    
    private func setUpLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        
        topImageContainerView.addSubview(emojiLabel)
        emojiLabel.topAnchor.constraint(equalTo: topImageContainerView.topAnchor).isActive = true
        emojiLabel.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor).isActive = true
        emojiLabel.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor).isActive = true
        
        view.addSubview(startButton)
        startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        startButton.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        startButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
        startButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        let scoreExplanation = UIButton()
        scoreExplanation.setTitle("Score System", for: .normal)
        scoreExplanation.titleLabel?.font = UIFont.boldSystemFont(ofSize: 48)
        scoreExplanation.setTitleColor(.black, for: .normal)
        scoreExplanation.addTarget(self, action: #selector(handleSE), for: .touchUpInside)
  
        let highScoreButton = UIButton()
        highScoreButton.setTitle("High Score", for: .normal)
        highScoreButton.setTitleColor(.black, for: .normal)
        highScoreButton.addTarget(self, action: #selector(handleHighScoreBtn), for: .touchUpInside)
        
        let bottomConainerView = UIStackView(arrangedSubviews: [scoreExplanation, highScoreButton])
        view.addSubview(bottomConainerView)
        bottomConainerView.axis = .vertical
        bottomConainerView.distribution = .fillEqually
        bottomConainerView.backgroundColor = .blue
        bottomConainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomConainerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        bottomConainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomConainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
    }
    
    @objc func handleHighScoreBtn(){
        let next = HighScoreViewController()
        show(next, sender: self)
    }
    
    @objc func handleSE() {
//        let next = ScoreSystemViewController()
//        show(next, sender: self)
    }
}


