//
//  ChooseWorldCupLabel.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/1/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

class ChooseWorldCupLabel: UILabel {
    
    func chooseQuizLabel() -> UILabel{
        let label = UILabel()
        label.text = "Choose World Cup Year"
        label.font = UIFont(name: "chalkduster", size: 24)
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }
    
}
