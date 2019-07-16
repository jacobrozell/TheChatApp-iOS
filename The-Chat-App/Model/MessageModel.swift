//
//  MessageModel.swift
//  The-Chat-App
//
//  Created by Jacob Rozell on 7/16/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit

class ChatMessage {
    let id: String
    let message: String
    let fromID: String
    let toID: String
    let timeStamp: String
    var imageURL = ""
    
    init(id: String, message: String, fromID: String, toID: String, timeStamp: String) {
        self.id = id
        self.message = message
        self.fromID = fromID
        self.toID = toID
        self.timeStamp = timeStamp
    }
}
