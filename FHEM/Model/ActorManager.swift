//
//  ActorManager.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

class ActorManager {
    
    private var actors = [Actor]()
    
    var apiClient = APIClient()
    
    var numberOfActors:Int {
        return actors.count
    }
    
    func itemAtIndex(index: Int) -> Actor {
        return actors.count > index ? actors[index] : Actor(name: "")
    }
    
    func addActor(actor:Actor) {
        actors.append(actor)
    }
    
    init() {
        print("Initializing... ItemManager")
        refresh()
    }
    
    func refresh() {
      
        let urlString = "http://supermanager.noip.me:8083/fhem?cmd=jsonlist2&XHR=1"
        apiClient.getActors(urlString) { (actors, error) in
            if error == nil {
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.actors = actors!
                    print("ItemManager sends out notification to reload CollectionView  ")
                    NSNotificationCenter.defaultCenter().postNotificationName("CollectionViewShouldReloadData", object: nil)
                }
            }
        }
    }
    
    func removeActorAtIndex(index:Int) {
        actors[index].visible = false
    }
    
    
}