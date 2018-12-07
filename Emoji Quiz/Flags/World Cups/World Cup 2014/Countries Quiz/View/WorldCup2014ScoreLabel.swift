//
//  WorldCup2014ScoreLabel.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/1/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class WorldCup2014ScoreLabel: UILabel {
    
    func scoreLabel()-> UILabel {
        let label = UILabel()
        label.text = "Score:\n999"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "chalkduster", size: 24)
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }
}

