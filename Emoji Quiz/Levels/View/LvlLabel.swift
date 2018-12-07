//
//  LvlLabel.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/29/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class LvlLabel: UILabel{
    
    func lvlLabel(_ level: Int, _ color: UIColor) -> UILabel{
        let label = UILabel()
        label.text = String(level)
        label.textAlignment = .center
        label.textColor = color
        label.backgroundColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 45)
        return label
    }
}
