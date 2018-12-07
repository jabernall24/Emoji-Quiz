//
//  WorldCup2018LevelEmoji.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/1/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class WorldCup2018LevelEmoji: UILabel{
    
    let e = WorldCup2018Emoji()
    
    func lvlEmoji() -> UILabel{
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 250)
        label.layer.borderWidth = 5.0
        label.layer.cornerRadius = 30
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func emojiAnswer(_ Level: Int) -> String {
        return e.list[Level - 1].emojiName
    }
}

