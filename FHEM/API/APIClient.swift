//
//  APIClient.swift
//  FHEM
//
//  Created by Marc Felden on 31.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

class APIClient {
    
    lazy var session: FhemUrlSession = NSURLSession.sharedSession()
    
    func getActors(urlString: String, completion: ([Actor]?,  ErrorType?) -> Void) {
        
        
        guard let url = NSURL(string: urlString) else {fatalError()}
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.timeoutIntervalForRequest = 5.0
        sessionConfig.timeoutIntervalForResource = 5.0
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if error != nil {
                completion(nil,WebserviceError.ResponseError)
                return
            }
            
            if let data = data {
                
                    let stringData = String(data: data, encoding: NSASCIIStringEncoding)
                    print("\(NSDate().toHourMinuteSecond()): Received Bytes: \(stringData?.characters.count ?? 0)")
                    let json = JSON(data: data )
                    
                   // print("jsonData: \(jsonData)")
                    
                    let results = json["Results"]
                    
                    var actors = [Actor]()
                    
                    for (_,result) in results {
                        print(result)
                        let internals = result["Internals"]
                        let name = internals["NAME"].stringValue
                        let state = internals["STATE"].stringValue
                        let xxx = internals["ROOM"].stringValue
                        //print("\(name)  \(xxx) " )
                        let actor = Actor(name: name, state: state, imageName: nil)

                        let attributes =  result["Attributes"]
                        let model = attributes["model"].stringValue
                        print()
                        if model == "itswitch" {
                            actors.append(actor)
                        }
                    }
                    
                    actors.sortInPlace({ $1.name > $0.name })
                    completion(actors, nil)
                
               
            }

            else {
                completion(nil,WebserviceError.DataEmptyError)
            }
        }
        task.resume()
        
        }
    
    
    func turnOn(actor:Actor, completion: (String?,  ErrorType?) -> Void) {
        print("Turning on: \(actor.name)")
        
        let deviceName = actor.name
        assert(!deviceName.isEmpty)
        
        let onOff = actor.state == "on" ? "off" : "on"
        //let urlString = "supermanager.noip.me:8083/fhem?cmd=set+\(deviceName)+on"
        let urlString = "http://home:8083/fhem?cmd=set+\(deviceName)+\(onOff)"
        print(urlString)
        
        guard let url = NSURL(string: urlString) else {fatalError()}
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.timeoutIntervalForRequest = 5.0
        sessionConfig.timeoutIntervalForResource = 5.0
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if error != nil {
                completion(nil,WebserviceError.ResponseError)
                return
            }
            if let data = data {
                let stringData = String(data: data, encoding: NSASCIIStringEncoding)
                completion(stringData, nil)
            }
            else {
                completion(nil,WebserviceError.DataEmptyError)
            }
        }
        task.resume()
 
    }
    
    
}


protocol FhemUrlSession {
    func dataTaskWithURL(url: NSURL,
                         completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask
}

extension NSURLSession : FhemUrlSession { }


enum WebserviceError : ErrorType {
    case DataEmptyError
    case ResponseError
}



