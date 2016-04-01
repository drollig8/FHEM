//
//  SettingsViewController.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController, UITableViewDataSource {
    
    
    // manuelle Art einen Settings Table zu schaffen
    
    // ist aber noch nicht weiter getestet.
    
    
    var tableView: UITableView!
    var serverNameCell = UITableViewCell()
    var serverNameTextField = UITextField()
    var settingsManager = SettingsManager()
    
    override func loadView() {
        super.loadView()
        
        title = "Settings"
        
        serverNameCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        serverNameTextField = UITextField(frame: CGRectInset(serverNameCell.contentView.bounds,15,0))
        serverNameTextField.placeholder = "http://<Servername>:<Port>"
        serverNameCell.addSubview(serverNameTextField)

        
    }
    
    override func viewDidLoad() {

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .Grouped)
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(close))
        tableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 1
        default: fatalError()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return serverNameCell
            case 1:
                return serverNameCell
            default:
                fatalError()
            }
        default:
            return serverNameCell
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Server Settings"
        default:
            "andere Settings"
        }
        return nil
    }
    
    func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
