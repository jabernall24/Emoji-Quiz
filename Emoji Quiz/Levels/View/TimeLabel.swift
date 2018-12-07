//
//  TimeLabel.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/29/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class TimeLabel: UILabel{
    
    func timeLabel() -> UILabel{
        let label = UILabel()
        label.text = "10"
        label.textAlignment = .center
        label.font = UIFont(name: "chalkduster", size: 40)
        return label
    }
}
