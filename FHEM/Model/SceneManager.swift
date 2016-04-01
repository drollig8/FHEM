//
//  SceneManager.swift
//  FHEM
//
//  Created by Marc Felden on 01.04.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

class SceneManager {
    
    private var scenes = [Scene]()
    var numberOfScenes:Int {
        return scenes.count
    }
    
    func addScene(scene:Scene) {
        scenes.append(scene)
    }
    
    
}
