//
//  EmojiSelector.swift
//  Swipe
//
//  Created by Jesus Andres Bernal Lopez on 3/29/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

class AnimalEmojiSelector{
    
    var emoji = ""
    var emojiName = ""
    var secondEmojiName = ""
    var thirdEmojiName = ""
    
    init(){
        
    }
    
    convenience init(_ emoji: String, _ emojiName: String){
        self.init()
        self.emoji = emoji
        self.emojiName = emojiName
    }
    
    convenience init(_ emoji: String, _ emojiName: String, _ secondEmojiName: String){
        self.init()
        self.emoji = emoji
        self.emojiName = emojiName
        self.secondEmojiName = secondEmojiName
    }
    
    convenience init (_ emoji: String, _ emojiName: String, _ secondEmojiName: String, _ thirdEmojiName: String){
        self.init()
        self.emoji = emoji
        self.emojiName = emojiName
        self.secondEmojiName = secondEmojiName
        self.thirdEmojiName = thirdEmojiName
    }
}
