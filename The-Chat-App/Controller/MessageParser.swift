//
//  MessageParser.swift
//  The-Chat-App
//
//  Created by Jacob Rozell on 7/22/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MesssageParser {
    func retrieveMessages() -> [ChatMessage] {
        var messages: [ChatMessage] = [ChatMessage]()
        let messageDB = Database.database().reference().child("latest-messages")

        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let text = snapshotValue["text"]!
            let id = snapshotValue["id"]!
            let timestamp = snapshotValue["timestamp"]!
            let toID = snapshotValue["toID"]!
            let fromID = snapshotValue["fromID"]!
            messages.append(ChatMessage(id: id, message: text, fromID: fromID, toID: toID, timeStamp: timestamp))
        }
        return messages
    }
}
