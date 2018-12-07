//
//  AnimalQuestionNumberLabel.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/2/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class AnimalQuestionNumberLabel{
    
    func questionNumberLabel() -> UILabel{
        let label = UILabel()
        label.backgroundColor = .black
        label.text = "xx/xx"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "chalkduster", size: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
