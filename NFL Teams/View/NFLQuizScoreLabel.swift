//
//  NFLQuizScoreLabel.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/2/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class NFLQuizScoreLabel{
    
    func scoreLabel() -> UILabel {
        let label = UILabel()
        label.text = "Score:\n0"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.backgroundColor = .black
        label.textColor = .white
        label.font = UIFont(name: "chalkduster", size: 24)
        return label
    }
}
