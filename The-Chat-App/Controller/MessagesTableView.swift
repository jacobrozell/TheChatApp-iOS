//
//  ViewController.swift
//  The-Chat-App
//
//  Created by Jacob Rozell on 7/16/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import SnapKit

class MessageCell: UITableViewCell {
    static let reuse = "MessageCell"
    
    let card = UIView()
    var profileImage = UIImageView()
    var username = UILabel()
    var message = UILabel()
    var timestamp = UILabel()
    let headerView = UIView()
    
    func setup(imageURL: String="profile", username: String, message: String, timestamp: String) {
        self.username.text = username
        self.message.text = message
        self.timestamp.text = timestamp
        self.profileImage.image = UIImage(named: "profile")
        
        setupConstraints()
    }
    
    func setupConstraints() {
        self.addSubview(card)
        card.addSubview(message)
        card.addSubview(profileImage)
        card.addSubview(headerView)
        headerView.addSubview(username)
        headerView.addSubview(timestamp)
        
        card.layer.cornerRadius = 8.0
        card.clipsToBounds = true
        card.backgroundColor = .white
        card.layer.borderColor = UIColor.black.cgColor
        card.layer.borderWidth = 1.0
        
        message.numberOfLines = 3
        message.lineBreakMode = .byTruncatingTail
        
        card.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(4)
            make.bottom.right.equalToSuperview().offset(-4)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            //make.right.equalTo(headerView.snp.left)
            make.width.equalTo(100)
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.left.equalTo(profileImage.snp.right)
            make.bottom.equalTo(message.snp.top)
        }
        
        message.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview()
            make.left.equalTo(profileImage.snp.right)
            make.top.equalTo(headerView.snp.bottom)
        }
        
        username.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.bottom.equalToSuperview()
            make.right.equalTo(timestamp.snp.left)
        }
        
        timestamp.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            //make.left.equalTo(username.snp.right)
            make.width.equalTo(30)
        }
    }
}

class MessagesTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var messages: [ChatMessage] = [ChatMessage]()
    
    init(style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        self.register(MessageCell.self, forCellReuseIdentifier: MessageCell.reuse)
        self.delegate = self
        self.dataSource = self
        
        self.messages = MesssageParser().retrieveMessages()
        // Find messages for user / might be better to do this in a controller to conform to low cohesion
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - TableView Delegate/Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.reuse, for: indexPath) as? MessageCell else {return UITableViewCell() }
        let index = messages[indexPath.row]
        
        let imageURL = index.imageURL
        let message = index.message
        let timestamp = index.timeStamp
        
        cell.setup(imageURL: imageURL, username: "jNelson", message: message, timestamp: timestamp)
        cell.backgroundColor = .clear
        cell.layer.cornerRadius = 12.0
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        // init chat and then present it
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

