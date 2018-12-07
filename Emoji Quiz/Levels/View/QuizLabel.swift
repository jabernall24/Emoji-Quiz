//
//  DifficultyLabel.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/28/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class QuizLabel: UILabel{
    
    func label(labelText text: String, textColor color: UIColor)-> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }
}
