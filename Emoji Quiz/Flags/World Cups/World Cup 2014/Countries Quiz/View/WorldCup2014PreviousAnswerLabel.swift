//
//  WorldCup2014PreviousAnswerLabel.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/1/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

class WorldCup2014PreviousAnswerLabel{
    
    func previousAnswerLabel() -> UILabel{
        let label = UILabel()
        label.text = "Previous Flag:\nName: "
        label.numberOfLines = 2
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
