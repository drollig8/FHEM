//
//  SceneEditorViewController.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit



class SceneEditorViewController: UIViewController, UITableViewDataSource {

    var tableView: UITableView!
    var sceneManager = SceneManager()
    var groupname = ""
    var membersOn:[Actor]!
    var membersOff:[Actor]!
    
    var groupNameCell = UITableViewCell()
    var groupNameTextField: UITextField!
    
    override func loadView() {
        super.loadView()
        
        groupNameCell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        groupNameTextField = UITextField(frame: CGRectInset(groupNameCell.contentView.bounds, 15, 0))
        groupNameTextField.placeholder = "Scenen-Name: e.g. \"TV Scene\""
        groupNameCell.addSubview(groupNameTextField)
        
    }
    
    override func viewDidLoad() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .Grouped)
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(save))
        
        tableView.dataSource = self
    }
    
    func save() {
        
    }
    
    // MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 0
        case 2: return 0
        case 3: return 0
        default:
            fatalError()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        groupNameTextField.text = "Test"//groupname
        return groupNameCell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Scenen Name"
        case 1:
            return "Mitglieder - einschalten"
        default:
            return ""
        }
        return "Scenen Name"
    }
    
}
