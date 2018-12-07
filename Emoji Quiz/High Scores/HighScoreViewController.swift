//
//  File.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 8/31/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

class HighScoreViewController: UIViewController {
    
    let numberOfQuizzes = 6
    let defaults = UserDefaults.standard
    
    let resetAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset All", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(HighScoreViewController.handleResetAll), for: .touchUpInside)
        return button
    }()
    let resetAnimalsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6043084734, green: 0.5158795253, blue: 0.7583941173, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(HighScoreViewController.handleResetAnimals), for: .touchUpInside)
        return button
    }()
    let resetSmileysButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(HighScoreViewController.handleResetSmileys), for: .touchUpInside)
        return button
    }()
    let resetRussia2018Button: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6043084734, green: 0.5158795253, blue: 0.7583941173, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(HighScoreViewController.handleResetRussia2018), for: .touchUpInside)
        return button
    }()
    let resetBrazil2014Button: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(HighScoreViewController.handleResetBrazil2014), for: .touchUpInside)
        return button
    }()
    let resetAllFlagsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6043084734, green: 0.5158795253, blue: 0.7583941173, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(HighScoreViewController.handleResetAllFlags), for: .touchUpInside)
        return button
    }()
    let resetNFLButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(HighScoreViewController.handleResetNFL), for: .touchUpInside)
        return button
    }()
    
    @objc func handleResetAll(){
        defaults.set(0, forKey: "animalHighScore")
        defaults.set(0, forKey: "smileysHighScore")
        defaults.set(0, forKey: "russia2018HighScore")
        defaults.set(0, forKey: "brazil2014HighScore")
        defaults.set(0, forKey: "allFlagsHighScore")
        defaults.set(0, forKey: "nflHighScore")
        defaults.synchronize()
        setUpLayout()
    }
    @objc func handleResetAnimals(){
        defaults.set(0, forKey: "animalHighScore")
        defaults.synchronize()
        setUpLayout()
    }
    @objc func handleResetSmileys(){
        defaults.set(0, forKey: "smileysHighScore")
        defaults.synchronize()
        setUpLayout()
    }
    @objc func handleResetRussia2018(){
        defaults.set(0, forKey: "russia2018HighScore")
        defaults.synchronize()
        setUpLayout()
    }
    @objc func handleResetBrazil2014(){
        defaults.set(0, forKey: "brazil2014HighScore")
        defaults.synchronize()
        setUpLayout()
    }
    @objc func handleResetAllFlags(){
        defaults.set(0, forKey: "allFlagsHighScore")
        defaults.synchronize()
        setUpLayout()
    }
    @objc func handleResetNFL(){
        defaults.set(0, forKey: "nflHighScore")
        defaults.synchronize()
        setUpLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpLayout()
    }
    
    func setUpLayout() {
        let exitButton = UIButton()
        view.addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        exitButton.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        exitButton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        exitButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        exitButton.backgroundColor = .red
        exitButton.setTitle("X", for: .normal)
        exitButton.addTarget(self, action: #selector(handleExit), for: .touchUpInside)
        
        let highScoreLbl = UILabel()
        view.addSubview(highScoreLbl)
        highScoreLbl.translatesAutoresizingMaskIntoConstraints = false
        highScoreLbl.safeAreaLayoutGuide.topAnchor.constraint(equalTo: exitButton.bottomAnchor).isActive = true
        highScoreLbl.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        highScoreLbl.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        highScoreLbl.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        highScoreLbl.text = "High Scores"
        highScoreLbl.font = UIFont(name: "SavoyeLetPlain", size: 50)
        highScoreLbl.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        highScoreLbl.textAlignment = .center
        view.addSubview(resetAllButton)
        resetAllButton.leadingAnchor.constraint(equalTo: highScoreLbl.trailingAnchor).isActive = true
        resetAllButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        resetAllButton.topAnchor.constraint(equalTo: exitButton.bottomAnchor).isActive = true
        resetAllButton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        let bottomContainerView = UIView()
        view.addSubview(bottomContainerView)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomContainerView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomContainerView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomContainerView.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        bottomContainerView.backgroundColor = .black
        
        let middleContainerView = UIView()
        view.addSubview(middleContainerView)
        middleContainerView.translatesAutoresizingMaskIntoConstraints = false
        middleContainerView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: highScoreLbl.bottomAnchor).isActive = true
        middleContainerView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        middleContainerView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        middleContainerView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        
        let animalsHighScore = defaults.integer(forKey: "animalHighScore")
        let animalsHighScoreLbl = UILabel()
        middleContainerView.addSubview(animalsHighScoreLbl)
        animalsHighScoreLbl.translatesAutoresizingMaskIntoConstraints = false
        animalsHighScoreLbl.topAnchor.constraint(equalTo: middleContainerView.topAnchor).isActive = true
        animalsHighScoreLbl.leadingAnchor.constraint(equalTo: middleContainerView.leadingAnchor).isActive = true
        animalsHighScoreLbl.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.7).isActive = true
        animalsHighScoreLbl.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        animalsHighScoreLbl.backgroundColor = #colorLiteral(red: 0.6043084734, green: 0.5158795253, blue: 0.7583941173, alpha: 1)
        animalsHighScoreLbl.text = "Animals\t\t\(animalsHighScore)"
        animalsHighScoreLbl.textAlignment = .center
        middleContainerView.addSubview(resetAnimalsButton)
        resetAnimalsButton.topAnchor.constraint(equalTo: middleContainerView.topAnchor).isActive = true
        resetAnimalsButton.leadingAnchor.constraint(equalTo: animalsHighScoreLbl.trailingAnchor).isActive = true
        resetAnimalsButton.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.3).isActive = true
        resetAnimalsButton.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        
        let smyleysHighScore = defaults.integer(forKey: "smileysHighScore")
        let smileysHighScoreLbl = UILabel()
        middleContainerView.addSubview(smileysHighScoreLbl)
        smileysHighScoreLbl.translatesAutoresizingMaskIntoConstraints = false
        smileysHighScoreLbl.topAnchor.constraint(equalTo: animalsHighScoreLbl.bottomAnchor).isActive = true
        smileysHighScoreLbl.leadingAnchor.constraint(equalTo: middleContainerView.leadingAnchor).isActive = true
        smileysHighScoreLbl.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.7).isActive = true
        smileysHighScoreLbl.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        smileysHighScoreLbl.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        smileysHighScoreLbl.text = "Smileys\t\t\(smyleysHighScore)"
        smileysHighScoreLbl.textAlignment = .center
        middleContainerView.addSubview(resetSmileysButton)
        resetSmileysButton.topAnchor.constraint(equalTo: resetAnimalsButton.bottomAnchor).isActive = true
        resetSmileysButton.leadingAnchor.constraint(equalTo: smileysHighScoreLbl.trailingAnchor).isActive = true
        resetSmileysButton.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.3).isActive = true
        resetSmileysButton.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        
        let russia2018HighScore = defaults.integer(forKey: "russia2018HighScore")
        let russia2018HighScoreLbl = UILabel()
        middleContainerView.addSubview(russia2018HighScoreLbl)
        russia2018HighScoreLbl.translatesAutoresizingMaskIntoConstraints = false
        russia2018HighScoreLbl.topAnchor.constraint(equalTo: smileysHighScoreLbl.bottomAnchor).isActive = true
        russia2018HighScoreLbl.leadingAnchor.constraint(equalTo: middleContainerView.leadingAnchor).isActive = true
        russia2018HighScoreLbl.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.7).isActive = true
        russia2018HighScoreLbl.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        russia2018HighScoreLbl.backgroundColor = #colorLiteral(red: 0.6043084734, green: 0.5158795253, blue: 0.7583941173, alpha: 1)
        russia2018HighScoreLbl.text = "Russia 2018\t\t\(russia2018HighScore)"
        russia2018HighScoreLbl.textAlignment = .center
        middleContainerView.addSubview(resetRussia2018Button)
        resetRussia2018Button.topAnchor.constraint(equalTo: resetSmileysButton.bottomAnchor).isActive = true
        resetRussia2018Button.leadingAnchor.constraint(equalTo: russia2018HighScoreLbl.trailingAnchor).isActive = true
        resetRussia2018Button.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.3).isActive = true
        resetRussia2018Button.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        
        let brazil2014HighScore = defaults.integer(forKey: "brazil2014HighScore")
        let brazil2014HighScoreLbl = UILabel()
        middleContainerView.addSubview(brazil2014HighScoreLbl)
        brazil2014HighScoreLbl.translatesAutoresizingMaskIntoConstraints = false
        brazil2014HighScoreLbl.topAnchor.constraint(equalTo: russia2018HighScoreLbl.bottomAnchor).isActive = true
        brazil2014HighScoreLbl.leadingAnchor.constraint(equalTo: middleContainerView.leadingAnchor).isActive = true
        brazil2014HighScoreLbl.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.7).isActive = true
        brazil2014HighScoreLbl.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        brazil2014HighScoreLbl.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        brazil2014HighScoreLbl.text = "Brazil 2014\t\t\(brazil2014HighScore)"
        brazil2014HighScoreLbl.textAlignment = .center
        middleContainerView.addSubview(resetBrazil2014Button)
        resetBrazil2014Button.topAnchor.constraint(equalTo: resetRussia2018Button.bottomAnchor).isActive = true
        resetBrazil2014Button.leadingAnchor.constraint(equalTo: brazil2014HighScoreLbl.trailingAnchor).isActive = true
        resetBrazil2014Button.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.3).isActive = true
        resetBrazil2014Button.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        
        let allFlagsHighScore = defaults.integer(forKey: "allFlagsHighScore")
        let allFlagsHighScoreLbl = UILabel()
        middleContainerView.addSubview(allFlagsHighScoreLbl)
        allFlagsHighScoreLbl.translatesAutoresizingMaskIntoConstraints = false
        allFlagsHighScoreLbl.topAnchor.constraint(equalTo: brazil2014HighScoreLbl.bottomAnchor).isActive = true
        allFlagsHighScoreLbl.leadingAnchor.constraint(equalTo: middleContainerView.leadingAnchor).isActive = true
        allFlagsHighScoreLbl.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.7).isActive = true
        allFlagsHighScoreLbl.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        allFlagsHighScoreLbl.backgroundColor = #colorLiteral(red: 0.6043084734, green: 0.5158795253, blue: 0.7583941173, alpha: 1)
        allFlagsHighScoreLbl.text = "All Flags\t\t\(allFlagsHighScore)"
        allFlagsHighScoreLbl.textAlignment = .center
        middleContainerView.addSubview(resetAllFlagsButton)
        resetAllFlagsButton.topAnchor.constraint(equalTo: resetBrazil2014Button.bottomAnchor).isActive = true
        resetAllFlagsButton.leadingAnchor.constraint(equalTo: allFlagsHighScoreLbl.trailingAnchor).isActive = true
        resetAllFlagsButton.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.3).isActive = true
        resetAllFlagsButton.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        
        let nflHighScore = defaults.integer(forKey: "nflHighScore")
        let nflHighScoreLbl = UILabel()
        middleContainerView.addSubview(nflHighScoreLbl)
        nflHighScoreLbl.translatesAutoresizingMaskIntoConstraints = false
        nflHighScoreLbl.topAnchor.constraint(equalTo: allFlagsHighScoreLbl.bottomAnchor).isActive = true
        nflHighScoreLbl.leadingAnchor.constraint(equalTo: middleContainerView.leadingAnchor).isActive = true
        nflHighScoreLbl.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.7).isActive = true
        nflHighScoreLbl.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
        nflHighScoreLbl.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        nflHighScoreLbl.text = "NFL\t\t\(nflHighScore)"
        nflHighScoreLbl.textAlignment = .center
        middleContainerView.addSubview(resetNFLButton)
        resetNFLButton.topAnchor.constraint(equalTo: resetAllFlagsButton.bottomAnchor).isActive = true
        resetNFLButton.leadingAnchor.constraint(equalTo: allFlagsHighScoreLbl.trailingAnchor).isActive = true
        resetNFLButton.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor, multiplier: 0.3).isActive = true
        resetNFLButton.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor, multiplier: 1/CGFloat(numberOfQuizzes)).isActive = true
    }
    
    @objc func handleExit() {
        let next = HomePageViewController()
        show(next, sender: self)
    }
}
