//
//  Actor.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

struct Actor {
    
    let name: String
    var state: String? // on, off
    let imageName: String?
    var visible: Bool
    

    
    
    init(name: String, state:String?=nil, imageName:String?=nil, visible:Bool=true) {
        self.name = name
        self.state = state
        self.imageName = imageName
        self.visible = visible
    }
    
}