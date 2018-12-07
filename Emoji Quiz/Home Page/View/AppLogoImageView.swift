//
//  StartPageImageView.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/28/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

extension UIColor{
    static var mediumLvlColor = UIColor(red: 150/255, green: 0/255, blue: 255/255, alpha: 1)
}

class AppLogoImageView: UIView{
    
    func startPageImage() -> UIImageView{
        let image = UIImageView(image: #imageLiteral(resourceName: "App Icon"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
