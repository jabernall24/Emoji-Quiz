//
//  MediumLevelOne.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/30/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class SmileyQuiz: UIViewController, UITextFieldDelegate{
    
    let defaults = UserDefaults.standard
    var highscore = 0
    
    let sound = ThemeMusic()
    let wrongAnswerSound = "Wrong-answer"
    let wrongAnswerSoundExtension = "mp3"
    let correctAnswerSoundExtension = "mp3"
    let correctAnswerSound = "Correct-answer"
    
    let timeLabel = TimeLabel().timeLabel()
    let allQuestions = SmileyEmoji()
    var pickedAnswer = ""
    var lvlNumber = 0
    var score = 0
    let scoreLabel = SmileyScoreLabel().scoreLabel()
    let lvlEmoji = SmileyLevelEmoji().lvlEmoji()
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
    let previousAnswerLabel = SmileyPreviousAnswerLabel().previousAnswerLabel()
    var previousEmoji = ""
    var previousEmojiName = ""
    var previousAnswerText = ""
    let questionNumberLabel = FlagQuestionNumberLabel().questionNumberLabel()
    
    func nextQuestion(){
        view.backgroundColor = .white
        if lvlNumber < numberOfQuestions{
            if lvlNumber == 0{
                randomNumber = Int(arc4random_uniform(UInt32(allQuestions.list.count)))
                lvlEmoji.text = allQuestions.list[randomNumber].emoji
            }else{
                randomNumber = Int(arc4random_uniform(UInt32(allQuestions.list.count)))
                lvlEmoji.text = allQuestions.list[randomNumber].emoji
                previousAnswerLabel.text = "Previous Smiley: \(previousEmoji)\nName: \(previousEmojiName)"
                previousAnswerText = previousAnswerLabel.text!
            }
            previousEmoji = allQuestions.list[randomNumber].emoji
            previousEmojiName = allQuestions.list[randomNumber].emojiName
            updateUI()
        }else{
            gameTimer.invalidate()
            
            if score > defaults.integer(forKey: "smileysHighScore"){
                highscore = score
                defaults.set(highscore, forKey: "smileysHighScore")
                defaults.synchronize()
            }
            
            previousAnswerLabel.text = "Previous Smiley: \(previousEmoji) Name: \(previousEmojiName)"
            previousAnswerText = previousAnswerLabel.text!
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
    
    func updateUI() {
        scoreLabel.text = "Score:\n\(score)"
        questionNumberLabel.text = "\(lvlNumber)/\(numberOfQuestions)"
    }
    
    @objc func gameTimerStart() {
        view.backgroundColor = .white
        gameTimeLeft -= 1
        timeLabel.text = String(gameTimeLeft)
        if lvlNumber == numberOfQuestions{
            gameTimer.invalidate()
            lvlTextField.text = ""
            lvlNumber += 1
            nextQuestion()
        }else if gameTimeLeft >= 1 && gameTimeLeft <= 3{
            view.backgroundColor = .red
        }else if gameTimeLeft == 0 && lvlNumber != numberOfQuestions{
            gameTimer.invalidate()
            sound.playSound(soundFile: wrongAnswerSound, extensionType: wrongAnswerSoundExtension, playFor: 0)
            lvlTextField.text = ""
            lvlNumber += 1
            if incorrectAttempts < noAnswerPoints{
                score -= noAnswerPoints - incorrectAttempts
            }
            incorrectAttempts = 0
            nextQuestion()
            gameTimeLeft = 10
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SmileyQuiz.gameTimerStart), userInfo: nil, repeats: true)
        }
    }
    
    private let lvlTextField: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.textAlignment = .center
        text.placeholder = "Enter the face the emoji is making"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    func checkAnswer() {
        if lvlTextField.text?.lowercased() == allQuestions.list[randomNumber].emojiName{
            allQuestions.list.remove(at: randomNumber)
            answeredCorrectly += 1
            gameTimer.invalidate()
            lvlTextField.text = ""
            lvlNumber += 1
            score += correctAnswerPoints
            nextQuestion()
            gameTimeLeft = 10
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SmileyQuiz.gameTimerStart), userInfo: nil, repeats: true)
            sound.playSound(soundFile: correctAnswerSound , extensionType: correctAnswerSoundExtension , playFor: 0)
        }else{
            incorrectAttempts += 1
            lvlTextField.text = ""
            score -= incorrectAnswerPoints
            sound.playSound(soundFile: wrongAnswerSound, extensionType: wrongAnswerSoundExtension, playFor: 0)
        }
        updateUI()
    }
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("QUIT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handlePrev(){
        gameTimer.invalidate()
        let previosScreen = StartButtonTouchedViewController()
        show(previosScreen, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        lvlSetUpLayout()
        lvlTextField.delegate = self
        
        updateUI()
        nextQuestion()
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SmileyQuiz.gameTimerStart), userInfo: nil, repeats: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lvlTextField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        checkAnswer()
        return true
    }
    
    private func lvlSetUpLayout() {
        let topPortionContainerView = UIStackView(arrangedSubviews: [previousButton, scoreLabel, timeLabel])
        topPortionContainerView.distribution = .fillEqually
        view.addSubview(topPortionContainerView)
        topPortionContainerView.translatesAutoresizingMaskIntoConstraints = false
        topPortionContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topPortionContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topPortionContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topPortionContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/10).isActive = true
        
        view.addSubview(previousAnswerLabel)
        previousAnswerLabel.topAnchor.constraint(equalTo: topPortionContainerView.bottomAnchor).isActive = true
        previousAnswerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        previousAnswerLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 2/3).isActive = true
        previousAnswerLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(questionNumberLabel)
        questionNumberLabel.topAnchor.constraint(equalTo: topPortionContainerView.bottomAnchor).isActive = true
        questionNumberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        questionNumberLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1/3).isActive = true
        questionNumberLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(lvlEmoji)
        lvlEmoji.topAnchor.constraint(equalTo: previousAnswerLabel.bottomAnchor).isActive = true
        lvlEmoji.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        lvlEmoji.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        lvlEmoji.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        let textContainerView = UIView()
        view.addSubview(textContainerView)
        textContainerView.translatesAutoresizingMaskIntoConstraints = false
        textContainerView.topAnchor.constraint(equalTo: lvlEmoji.bottomAnchor).isActive = true
        textContainerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textContainerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        textContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/20).isActive = true
        
        textContainerView.addSubview(lvlTextField)
        lvlTextField.centerXAnchor.constraint(equalTo: textContainerView.centerXAnchor).isActive = true
        lvlTextField.centerYAnchor.constraint(equalTo: textContainerView.centerYAnchor).isActive = true
        lvlTextField.widthAnchor.constraint(equalTo: textContainerView.widthAnchor).isActive = true
        lvlTextField.heightAnchor.constraint(equalTo: textContainerView.heightAnchor).isActive = true
    }
    
}

