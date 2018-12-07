//
//  WorldCupQuizzesOptions.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/1/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class WorldCupQuizzesOptions: UIViewController {
    
    let displayLabel = ChooseWorldCupLabel().chooseQuizLabel()
    
    private let worldCup2014Button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Brazil 2014", for: .normal)
        button.titleLabel?.font = UIFont(name: "chalkduster", size: 48)
        button.layer.cornerRadius = 50
        button.backgroundColor = .blue
        button.setBackgroundImage(#imageLiteral(resourceName: "brazil2014"), for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handle2014), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handle2014(){
        let next = WorldCup2014Quiz()
        show(next, sender: self)
    }
    
    private let worldCup2018Button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Russia 2018", for: .normal)
        button.titleLabel?.font = UIFont(name: "chalkduster", size: 48)
        button.layer.cornerRadius = 50
        button.backgroundColor = .red
        button.setBackgroundImage(#imageLiteral(resourceName: "Russia2018"), for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handle2018), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handle2018(){
        let next = WorldCup2018Quiz()
        show(next, sender: self)
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
        let previosScreen = FlagQuizzesOptions()
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
        
        scroll.addSubview(worldCup2018Button)
        worldCup2018Button.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        worldCup2018Button.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        worldCup2018Button.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: scrollViewButtonMultiplier).isActive = true
        worldCup2018Button.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 0.9).isActive = true
        
        scroll.addSubview(worldCup2014Button)
        worldCup2014Button.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        worldCup2014Button.topAnchor.constraint(equalTo: worldCup2018Button.bottomAnchor).isActive = true
        worldCup2014Button.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: scrollViewButtonMultiplier).isActive = true
        worldCup2014Button.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 0.9).isActive = true
        
        // add to scroll view above here
        let scrollViewButtonHeight = view.safeAreaLayoutGuide.layoutFrame.height * scrollViewButtonMultiplier
        let height = scrollViewButtonHeight * CGFloat(scroll.subviews.count)
        scroll.contentSize.height = height
    }
}
