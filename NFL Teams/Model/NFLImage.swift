//
//  NFLImage.swift
//  Emoji Quiz
//
//  Created by Jesus Andres Bernal Lopez on 4/2/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class NFLImage{
    var list = [NFLIMageSelector]()
    
    init() {
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "nfl49ers") ,"49ers"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "bears"), "bears"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "bengals"), "bengals"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "bills"), "bills"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "broncos"), "broncos"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "browns"), "browns"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "buccaneers"), "buccaneers"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "cardinals"), "cardinals"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "chargers"), "chargers"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "chiefs"), "chiefs"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "colts"), "colts"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "cowboys"), "cowboys"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "dolphins"), "dolphins"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "eagles"), "eagles"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "falcons"), "falcons"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "giants"), "giants"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "jaguars"), "jaguars"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "jets"), "jets"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "lions"), "lions"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "packers"), "packers"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "panthers"), "panthers"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "patriots"), "patriots"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "raiders"), "raiders"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "rams"), "rams"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "ravens"), "ravens"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "redskins"), "redskins"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "saints"), "saints"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "seahawks"), "seahawks"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "steelers"), "steelers"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "texans"), "texans"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "titans"), "titans"))
        list.append(NFLIMageSelector(#imageLiteral(resourceName: "vikings"), "vikings"))
    }
}
