//
//  AppController.swift
//  The-Chat-App
//
//  Created by Jacob Rozell on 7/16/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import SnapKit

class AppController: UIViewController {
    
    let tableView = MessagesTableView(style: .plain)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.navigationItem.hidesBackButton = true
        self.title = "Messages"
        tableView.backgroundColor = .orange
        
        
        self.view.addSubview(tableView)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init(coder:) has not been implemented")
    }
    
    func setup() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
