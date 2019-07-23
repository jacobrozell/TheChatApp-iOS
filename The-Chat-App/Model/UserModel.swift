//
//  UserModel.swift
//  The-Chat-App
//
//  Created by Jacob Rozell on 7/23/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit

class UserModel {
    let uid: String
    let username: String
    let email: String
    
    init(uid: String, username: String, email: String) {
        self.uid = uid
        self.username = username
        self.email = email
    }
}
