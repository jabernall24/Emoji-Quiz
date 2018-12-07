//
//  WorldCupFlagQuiz.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/1/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class FlagQuizzesOptions: UIViewController {
    
    let displayLabel = ChooseQuizLabel().chooseQuizLabel()
    
    private let worldCupQuizzesOptions: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("World Cups", for: .normal)
        button.titleLabel?.font = UIFont(name: "chalkduster", size: 50)
        button.layer.cornerRadius = 50
        button.backgroundColor = .red
        button.setBackgroundImage(#imageLiteral(resourceName: "fifa logo"), for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleWorldCupQuizzesOptions), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleWorldCupQuizzesOptions(){
        let next = WorldCupQuizzesOptions()
        show(next, sender: self)
    }
    
    private let allFlagsQuizButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("All Flags", for: .normal)
        button.titleLabel?.font = UIFont(name: "chalkduster", size: 50)
        button.layer.cornerRadius = 50
        button.backgroundColor = .blue
        button.setBackgroundImage(#imageLiteral(resourceName: "flags"), for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleAllFlagsQuiz), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleAllFlagsQuiz(){
        let allFlagsQuiz = AllFlagsQuiz()
        show(allFlagsQuiz, sender: self)
    }
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handlePrev(){
        let previosScreen = StartButtonTouchedViewController()
        show(previosScreen, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "geometric"))
    }
    
    func setUpLayout() {
        view.addSubview(previousButton)
        previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        previousButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        previousButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        previousButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(displayLabel)
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.topAnchor.constraint(equalTo: previousButton.bottomAnchor).isActive = true
        displayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        displayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        displayLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        let bottomContainerView = UIView()
        view.addSubview(bottomContainerView)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true

        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        view.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.topAnchor.constraint(equalTo: displayLabel.bottomAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        scroll.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        let scrollViewButtonMultiplier: CGFloat = 0.2
        
        scroll.addSubview(worldCupQuizzesOptions)
        worldCupQuizzesOptions.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        worldCupQuizzesOptions.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        worldCupQuizzesOptions.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 0.9).isActive = true
        worldCupQuizzesOptions.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: scrollViewButtonMultiplier).isActive = true
        
        scroll.addSubview(allFlagsQuizButton)
        allFlagsQuizButton.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        allFlagsQuizButton.topAnchor.constraint(equalTo: worldCupQuizzesOptions.bottomAnchor).isActive = true
        allFlagsQuizButton.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 0.9).isActive = true
        allFlagsQuizButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: scrollViewButtonMultiplier).isActive = true
        
        // add to scroll view above here
        let scrollViewButtonHeight = view.safeAreaLayoutGuide.layoutFrame.height * scrollViewButtonMultiplier
        let height = scrollViewButtonHeight * CGFloat(scroll.subviews.count)
        scroll.contentSize.height = height
    }
}
