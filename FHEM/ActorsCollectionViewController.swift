//
//  ActorsListViewController.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit


var editMode = false

class ActorsCollectionViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    var collectionDataProvider = ActorsDataProvider()
    let cellSize = CGSize(width: 80, height: 100)
    
    
    var resetButton: UIButton!
    override func viewDidLoad() {
        print("ActorsCollectionViewController: ViewDidLoad startet.")
        initiateCollectionView()
        self.view.addSubview(collectionView)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(refreshView), name: "CollectionViewShouldReloadData", object: nil)
        
        //configureResetButton()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Relaod", style: .Plain, target: self, action: #selector(refreshView))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .Plain, target: self, action: #selector(showSettings))
        print("ActorsCollectionViewController: ViewDidLoad finished.")
        
    }
    
    private func initiateCollectionView() {
        
        layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 35)
        
        layout.itemSize = cellSize
        
        collectionView = UICollectionView(frame: super.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.myWaterLightBlue()
        
        collectionView.dataSource = collectionDataProvider
        collectionView.delegate = collectionDataProvider
        
        collectionView.registerClass(ActorCell.self, forCellWithReuseIdentifier: "Cell")
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(activateDeletionMode))
        longPress.delegate = self
        collectionView.addGestureRecognizer(longPress)

    }
    
    func showSettings() {
        let settingsViewController = SettingsViewController()
        let navController = UINavigationController(rootViewController: settingsViewController)
        presentViewController(navController, animated: true, completion: nil)
    }
    
    func activateDeletionMode() {
        print("ACTIVATE DELETION MODE")
        editMode = true
        for cell in collectionView.visibleCells() {
            let customCell: ActorCell = cell as! ActorCell
            customCell.wobble()
        }
    }
    
    func edit() {
        for cell in collectionView.visibleCells() {
            let customCell: ActorCell = cell as! ActorCell
            customCell.stopWobble()
        }
    }
    
    /*
    func configureResetButton() {
        
        print("ActorsCollectionViewController: Configuring Reset Button")
        
        resetButton = UIButton(frame: CGRect(x: 30, y: 500, width: 100, height: 100))
        resetButton.backgroundColor = UIColor.greenColor()
        resetButton.addTarget(self, action: "reloadData", forControlEvents: .TouchUpInside)
        self.view.addSubview(resetButton)
    }
    */

    
    func reloadData() {
        collectionDataProvider.itemManager.refresh()
    }
    
    func refreshView() {
        print("ActorsCollectionViewController: RefreshingView")
        collectionView.reloadData()
    }
}
