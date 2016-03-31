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
    let imageName: String? = nil
    
    
    var iodev:String? = ""
    var group:String? = ""
    var model:String? = ""
    var room:String? = ""
    var def:String? = ""
    var name_internal:String? = ""
    var nr:String? = ""
    var type:String? = ""
    
    
    init(name: String, state:String?=nil) {
        self.name = name
        self.state = state
    }
    
}