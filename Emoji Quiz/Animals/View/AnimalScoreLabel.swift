//
//  ScoreLabel.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/28/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.


import UIKit

class AnimalScoreLavel: UILabel{
    
    func scoreLabel()->UILabel{
        let label = UILabel()
        label.text = "Score:\n0)"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "chalkduster", size: 24)
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }
}

