//
//  SettingsManager.swift
//  myWater
//
//  Created by Marc Felden on 19.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import Foundation



class SettingsManager:NSObject {
    
    
    var localServerName:String!
    var localServerPort:Int!
    var localServerRequiresAuthentication:Bool!
    
    var localServerUsername: String? = nil
    var localServerPassword: String? = nil

    override init() {
        let userdefault = NSUserDefaults.standardUserDefaults()
        localServerName = userdefault.valueForKey("localServerName") as? String ?? "http://raspberrypi"
        localServerPort = userdefault.integerForKey("localServerPort") ?? 8083
        localServerRequiresAuthentication = userdefault.boolForKey("localServerRequiresAuthentication") ?? false
        localServerUsername = userdefault.valueForKey("localServerUsername") as? String
        localServerPassword = userdefault.valueForKey("localServerPassword") as? String

    }
 
    func save() {
        let userdefault = NSUserDefaults.standardUserDefaults()
        userdefault.setValue(localServerName, forKey: "localServerName")
        userdefault.setInteger(localServerPort, forKey: "localServerPort")
        userdefault.setBool(localServerRequiresAuthentication, forKey: "localServerRequiresAuthentication")
        userdefault.setValue(localServerUsername, forKey: "localServerRequiresAuthentication")
        userdefault.setValue(localServerPassword, forKey: "localServerPassword")
        
        userdefault.synchronize()
        
    }
 
 
    func factoryReset() {
        
        localServerName = "http://raspberrypi"
        localServerPort = 8083
        
        localServerRequiresAuthentication = false
        localServerUsername  = nil
        localServerPassword = nil

        save()
    }

 
}