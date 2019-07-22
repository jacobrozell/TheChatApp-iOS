//
//  MessageParser.swift
//  The-Chat-App
//
//  Created by Jacob Rozell on 7/22/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import Firebase

class MesssageParser {
    func retrieveMessages() -> [ChatMessage] {
        let messages: [ChatMessage] = [ChatMessage]()
        let messageDB = Database.database().reference().child("latest-messages")

        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!

            print(text, sender)
            messages.append(Message(sender: sender, messageBody: text))
        }
    }
}
