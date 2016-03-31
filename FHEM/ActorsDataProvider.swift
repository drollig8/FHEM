//
//  SelectionDataProvider.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class ActorsDataProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    let itemManager = ActorManager()
    
    var page: Int = 0
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        print("ActorsDataProvider: returning number of Sections = 1")
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemManager.numberOfActors
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? ActorCell {
            cell.configureCellWithItem(itemManager.itemAtIndex(indexPath.row))
            return cell
        } else {
            return UICollectionViewCell()
        }

    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("ActorsDataProvider: didSelectItemAtIndexPath (editMode = \(editMode)")
        
        let actor = itemManager.itemAtIndex(indexPath.row)
        
        if editMode {
            itemManager.removeActorAtIndex(indexPath.row)
        } else {
            itemManager.apiClient.turnOn(actor) { (_, _) in
                
                dispatch_async(dispatch_get_main_queue()) {
                    print("ApiClient: Finished turning on or off Actor. Please reload data.")
                    self.itemManager.refresh()
                }
                
            }
        }
    }
    
    private func indexForIndexPath(indexPath: NSIndexPath) -> Int {
        

        switch indexPath {
          

            case NSIndexPath(forItem: 0, inSection: 0): return 0
            case NSIndexPath(forItem: 1, inSection: 0): return 1
            case NSIndexPath(forItem: 2, inSection: 0): return 2
            case NSIndexPath(forItem: 0, inSection: 1): return 3
            case NSIndexPath(forItem: 1, inSection: 1): return 4
            case NSIndexPath(forItem: 2, inSection: 1): return 5
            case NSIndexPath(forItem: 0, inSection: 2): return 6
            case NSIndexPath(forItem: 1, inSection: 2): return 7
            case NSIndexPath(forItem: 2, inSection: 2): return 8
            
            default: return 0
        }
    }
    
    
    
}