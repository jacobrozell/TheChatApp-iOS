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
        
        let userId = Auth.auth().currentUser!.uid
        let messageDB = Database.database().reference().child("latest-messages").child(userId)

        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, Any>
            let chatPartnerUsername = self.getUsername(uid: snapshot.key)
            let text = snapshotValue["text"]! as! String
            let id = snapshotValue["id"]! as! String
            let timestamp = snapshotValue["timestamp"]! as! Double
            let toID = snapshotValue["toID"]! as! String
            let fromID = snapshotValue["fromID"]! as! String
            
            messages.append(ChatMessage(id: id, message: text, fromID: fromID, toID: toID, timeStamp: self.formatTimeStamp(timestamp: timestamp), chatPartner: chatPartnerUsername))
        }
        return messages
    }
    
    func formatTimeStamp(timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
    
    func getUsername(uid: String) -> String {
        let database = Database.database().reference().child("users").child("uid")
        var username: String = ""

        database.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, Any>
            username = snapshotValue["username"]! as! String
        }
        return username
    }
}
