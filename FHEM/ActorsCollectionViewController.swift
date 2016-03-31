//
//  ActorsListViewController.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class ActorsCollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
//    var collectionDataProvider: SelectionDataProvider!
    let cellSize = CGSize(width: 80, height: 100)
    
    override func viewDidLoad() {
        
        initiateCollectionView()
        self.view.addSubview(collectionView)
        
    }
    
    private func initiateCollectionView() {
        
        layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 35)
        
        layout.itemSize = cellSize
        
        collectionView = UICollectionView(frame: super.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.myWaterLightBlue()
        /*
        collectionView.dataSource = collectionDataProvider
        collectionView.delegate = collectionDataProvider
        collectionView.registerClass(BeverageCell.self, forCellWithReuseIdentifier: "Cell")
 */
        
    }
}
