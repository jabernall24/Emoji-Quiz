//
//  NFLQuizViewController.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/1/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class NFLQuizViewController: UIViewController, UITextFieldDelegate {
    
    let defaults = UserDefaults.standard
    var highscore = 0
    
    let sound = ThemeMusic()
    let wrongAnswerSound = "Wrong-answer"
    let wrongAnswerSoundExtension = "mp3"
    let correctAnswerSoundExtension = "mp3"
    let correctAnswerSound = "Correct-answer"
    let timeLabel = TimeLabel().timeLabel()
    let image = NFLImage()
    var pickedAnswer = ""
    var questionNumber = 0
    var score = 0
    let scoreLabel = NFLQuizScoreLabel().scoreLabel()
    let imageView = NFLQuizImageView().imageView()
    let finalScoreLabel = UILabel()
    var gameTimeLeft = 10
    var gameTimer = Timer()
    var answeredCorrectly = 0
    let correctAnswerPoints = 10
    let incorrectAnswerPoints = 1
    let noAnswerPoints = 5
    var incorrectAttempts = 0
    var randomNumber = 0
    let numberOfQuestions = 10
    let perfetScore = 100
    let perfectScoreMessage = "Perfect"
    let greatScore = 90
    let greatScoreMessage = "Almost perfect"
    let goodScore = 80
    let goodScoreMessage = "Not bad"
    let okScore = 70
    let okScoreMessage = "Well what can I say mr/mrs average"
    let badScore = 60
    let badScoreMessage = "Keep Practicing"
    let belowBadScoreMessage = "My dog could of done better"
    let previousAnswerLabel = NFLQuizPreviousAnswerLabel().previousAnswerLabel()
    var previousImageName = ""
    var previousAnswerText = ""
    let questionNumberLabel = NFLQuizQuestionNumberLabel().questionNumberLabel()
    
    func nextQuestion(){
        view.backgroundColor = .white
        if questionNumber < numberOfQuestions{
            if questionNumber == 0{
                randomNumber = Int(arc4random_uniform(UInt32(image.list.count)))
                imageView.image = image.list[randomNumber].image
            }else{
                randomNumber = Int(arc4random_uniform(UInt32(image.list.count)))
                imageView.image = image.list[randomNumber].image
                previousAnswerLabel.text = "Previous Name:\n\(previousImageName)"
                previousAnswerText = previousAnswerLabel.text!
            }
            previousImageName = image.list[randomNumber].logoName
            updateUI()
            
        }else{
            previousAnswerLabel.text = "Previous Name:\(previousImageName)"
            previousAnswerText = previousAnswerLabel.text!
            gameTimer.invalidate()
            
            if score > defaults.integer(forKey: "nflHighScore"){
                highscore = score
                defaults.set(highscore, forKey: "nflHighScore")
                defaults.synchronize()
            }
            
            var alert = UIAlertController()
            if score == perfetScore{
                alert = UIAlertController(title: "\(perfectScoreMessage)", message: "\(previousAnswerText)\nScore: \(score)/\(numberOfQuestions * correctAnswerPoints)\nCorrect Answers: \(answeredCorrectly)/\(numberOfQuestions)", preferredStyle: .alert)
            }else if score > greatScore{
                alert = UIAlertController(title: "\(greatScoreMessage)", message: "\(previousAnswerText)\nScore: \(score)/\(numberOfQuestions * correctAnswerPoints)\nCorrect Answers: \(answeredCorrectly)/\(numberOfQuestions)", preferredStyle: .alert)
            }else if score > goodScore{
                alert = UIAlertController(title: "\(goodScoreMessage)", message: "\(previousAnswerText)\nScore: \(score)/\(numberOfQuestions * correctAnswerPoints)\nCorrect Answers: \(answeredCorrectly)/\(numberOfQuestions)", preferredStyle: .alert)
            }else if score > okScore{
                alert = UIAlertController(title: "\(okScoreMessage)", message: "\(previousAnswerText)\nScore: \(score)/\(numberOfQuestions * correctAnswerPoints)\nCorrect Answers: \(answeredCorrectly)/\(numberOfQuestions)", preferredStyle: .alert)
            }else if score > badScore{
                alert = UIAlertController(title: "\(badScoreMessage)", message: "\(previousAnswerText)\nScore: \(score)/\(numberOfQuestions * correctAnswerPoints)\nCorrect Answers: \(answeredCorrectly)/\(numberOfQuestions)", preferredStyle: .alert)
            }else if score <= badScore{
                alert = UIAlertController(title: "\(belowBadScoreMessage)", message: "\(previousAnswerText)\nScore: \(score)/\(numberOfQuestions * correctAnswerPoints)\nCorrect Answers: \(answeredCorrectly)/\(numberOfQuestions)", preferredStyle: .alert)
            }
            let restartAction = UIAlertAction(title: "Go Back", style: .default, handler: { (UIAlertAction) in
                self.show(StartButtonTouchedViewController(), sender: self)
            })
            alert.addAction(restartAction)
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func updateUI(){
        scoreLabel.text = "Score:\n\(score)"
        if questionNumber != numberOfQuestions{
            questionNumberLabel.text = "\(questionNumber + 1)/\(numberOfQuestions)"
        }
    }
    
    @objc func gameTimeStart() {
        view.backgroundColor = .white
        gameTimeLeft -= 1
        timeLabel.text = String(gameTimeLeft)
        if questionNumber == numberOfQuestions{
            gameTimer.invalidate()
            textField.text = ""
            questionNumber += 1
            nextQuestion()
        }else if gameTimeLeft >= 1 && gameTimeLeft <= 3{
            view.backgroundColor = .red
        }else if gameTimeLeft == 0 && questionNumber != numberOfQuestions{
            gameTimer.invalidate()
            sound.playSound(soundFile: wrongAnswerSound, extensionType: wrongAnswerSoundExtension, playFor: 0)
            textField.text = ""
            questionNumber += 1
            if incorrectAttempts < noAnswerPoints{
                score -= noAnswerPoints - incorrectAttempts
            }
            incorrectAttempts = 0
            nextQuestion()
            gameTimeLeft = 10
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(NFLQuizViewController.gameTimeStart), userInfo: nil, repeats: true)
        }
    }
 
    func checkAnswer() {
        if textField.text?.lowercased() == image.list[randomNumber].logoName{
            image.list.remove(at: randomNumber)
            answeredCorrectly += 1
            gameTimer.invalidate()
            textField.text = ""
            questionNumber += 1
            score += correctAnswerPoints
            nextQuestion()
            gameTimeLeft = 10
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(NFLQuizViewController.gameTimeStart), userInfo: nil, repeats: true)
            sound.playSound(soundFile: correctAnswerSound , extensionType: correctAnswerSoundExtension , playFor: 0)
        }else{
            incorrectAttempts += 1
            textField.text = ""
            score -= incorrectAnswerPoints
            sound.playSound(soundFile: wrongAnswerSound, extensionType: wrongAnswerSoundExtension, playFor: 0)
        }
        updateUI()
    }
    
    private let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Enter logo name"
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let quitButton: UIButton = {
        let button = UIButton()
        button.setTitle("QUIT", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handleQuit), for: .touchUpInside)
        return button
    }()
    
    @objc func handleQuit() {
        gameTimer.invalidate()
        let prior = StartButtonTouchedViewController()
        show(prior, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.delegate = self
        updateUI()
        setUpLayOut()
        nextQuestion()
        
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(NFLQuizViewController.gameTimeStart), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        checkAnswer()
        return true
    }
    
    func setUpLayOut() {
        let topSectionContainer = UIStackView(arrangedSubviews: [quitButton, scoreLabel, timeLabel])
        view.addSubview(topSectionContainer)
        topSectionContainer.distribution = .fillEqually
        topSectionContainer.translatesAutoresizingMaskIntoConstraints = false
        topSectionContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topSectionContainer.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        topSectionContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/10).isActive = true
        
        view.addSubview(previousAnswerLabel)
        previousAnswerLabel.topAnchor.constraint(equalTo: topSectionContainer.bottomAnchor).isActive = true
        previousAnswerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        previousAnswerLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 2/3).isActive = true
        previousAnswerLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(questionNumberLabel)
        questionNumberLabel.topAnchor.constraint(equalTo: topSectionContainer.bottomAnchor).isActive = true
        questionNumberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        questionNumberLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1/3).isActive = true
        questionNumberLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: previousAnswerLabel.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        
        view.addSubview(textField)
        textField.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        textField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/20).isActive = true
        
    }
}
