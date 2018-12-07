//
//  StartButtonTouchedViewController.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/27/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class StartButtonTouchedViewController: UIViewController {
    
    let startPageImageView = AppLogoImageView().startPageImage()
    
    
    let animalQuizButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setBackgroundImage(#imageLiteral(resourceName: "animals"), for: .highlighted)
        button.setTitle("Animals", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "chalkduster", size: 38)
        button.layer.cornerRadius = 50
        button.addTarget(self, action: #selector(AnimalsQuizButtonTouched), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let SmileysQuizButton: UIButton = {
        let button = UIButton()
        button.backgroundColor =  #colorLiteral(red: 0.5882352941, green: 0, blue: 1, alpha: 1)
        button.setBackgroundImage(#imageLiteral(resourceName: "smiley"), for: .highlighted)
        button.setTitle("Smileys", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "chalkduster", size: 38)
        button.layer.cornerRadius = 50
        button.addTarget(self, action: #selector(SmileysQuizButtonTouched), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let FlagsQuizButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setBackgroundImage(#imageLiteral(resourceName: "flags"), for: .highlighted)
        button.setTitle("Flags", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "chalkduster", size: 38)
        button.layer.cornerRadius = 50
        button.addTarget(self, action: #selector(FlagsQuizButtonTouched), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let NFLQuizButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setBackgroundImage(#imageLiteral(resourceName: "nfl logo"), for: .highlighted)
        button.setTitle("NFL", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "chalkduster", size: 38)
        button.layer.cornerRadius = 50
        button.addTarget(self, action: #selector(NFLQuizButtonTouched), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func AnimalsQuizButtonTouched() {
        let animalQuiz = AnimalQuiz()
        show(animalQuiz, sender: self)
    }
    
    @objc func SmileysQuizButtonTouched() {
        let smileyQuiz = SmileyQuiz()
        show(smileyQuiz, sender: self)
    }
    
    @objc func FlagsQuizButtonTouched() {
        let flagQuiz = FlagQuizzesOptions()
        show(flagQuiz, sender: self)
    }
    
    @objc func NFLQuizButtonTouched(){
        let nflQuiz = NFLQuizViewController()
        show(nflQuiz, sender: self)
    }
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("PREV", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handlePrev(){
        let prev = HomePageViewController()
        show(prev, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButtonTouchedLayout()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "geometric"))
    }
    
    private func startButtonTouchedLayout() {
        let bottomSpaceContainerView = UIView()
        //        bottomSpaceContainerView.backgroundColor = .orange
        view.addSubview(bottomSpaceContainerView)
        bottomSpaceContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomSpaceContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomSpaceContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomSpaceContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomSpaceContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/10).isActive = true
        
        bottomSpaceContainerView.addSubview(previousButton)
        previousButton.topAnchor.constraint(equalTo: bottomSpaceContainerView.topAnchor).isActive = true
        previousButton.bottomAnchor.constraint(equalTo: bottomSpaceContainerView.bottomAnchor).isActive = true
        previousButton.widthAnchor.constraint(equalTo: bottomSpaceContainerView.widthAnchor).isActive = true
        
        let middleButtonsContainerView = UIView()
//        middleButtonsContainerView.backgroundColor = .cyan
        view.addSubview(middleButtonsContainerView)
        middleButtonsContainerView.translatesAutoresizingMaskIntoConstraints = false
        middleButtonsContainerView.bottomAnchor.constraint(equalTo: bottomSpaceContainerView.topAnchor).isActive = true
        middleButtonsContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        middleButtonsContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        middleButtonsContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: (2/3)).isActive = true
        
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        middleButtonsContainerView.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.topAnchor.constraint(equalTo: middleButtonsContainerView.topAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: middleButtonsContainerView.bottomAnchor).isActive = true
        scroll.widthAnchor.constraint(equalTo: middleButtonsContainerView.widthAnchor).isActive = true
        
        let scrollViewButtonMultiplier: CGFloat = 0.2
        
        scroll.addSubview(animalQuizButton)
        animalQuizButton.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        animalQuizButton.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        animalQuizButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: scrollViewButtonMultiplier).isActive = true
        animalQuizButton.widthAnchor.constraint(equalTo: middleButtonsContainerView.widthAnchor, multiplier: 0.9).isActive = true
        
        scroll.addSubview(SmileysQuizButton)
        SmileysQuizButton.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        SmileysQuizButton.topAnchor.constraint(equalTo: animalQuizButton.bottomAnchor).isActive = true
        SmileysQuizButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: scrollViewButtonMultiplier).isActive = true
        SmileysQuizButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        
        scroll.addSubview(FlagsQuizButton)
        FlagsQuizButton.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        FlagsQuizButton.topAnchor.constraint(equalTo: SmileysQuizButton.bottomAnchor).isActive = true
        FlagsQuizButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: scrollViewButtonMultiplier).isActive = true
        FlagsQuizButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        
        scroll.addSubview(NFLQuizButton)
        NFLQuizButton.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        NFLQuizButton.topAnchor.constraint(equalTo: FlagsQuizButton.bottomAnchor).isActive = true
        NFLQuizButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: scrollViewButtonMultiplier).isActive = true
        NFLQuizButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        
        // add to scroll view above
        let scrollViewButtonHeight = view.safeAreaLayoutGuide.layoutFrame.height * scrollViewButtonMultiplier
        let height = scrollViewButtonHeight * CGFloat(scroll.subviews.count)
        scroll.contentSize.height = height
        
        let topImageContainerView = UIView()
        //        topImageContainerView.backgroundColor = .green
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topImageContainerView.bottomAnchor.constraint(equalTo: middleButtonsContainerView.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(startPageImageView)
        startPageImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        startPageImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        startPageImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 1.2).isActive = true
        startPageImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 1.2).isActive = true
    }
}
