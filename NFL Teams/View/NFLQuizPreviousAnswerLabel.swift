//
//  NFLQuizPreviousAnswerLabel.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/2/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class NFLQuizPreviousAnswerLabel{
    
    func previousAnswerLabel() -> UILabel{
        let label = UILabel()
        label.text = "Previous Answer:\n "
        label.numberOfLines = 2
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
