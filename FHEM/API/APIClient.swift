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
    
    func getFhemInfos(urlString: String, completion: ([FHEMInfo]?,  ErrorType?) -> Void) {
        
        
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
                do {
                    let stringData = String(data: data, encoding: NSASCIIStringEncoding)
                    print("\(NSDate().toHourMinuteSecond()): Received Bytes: \(stringData?.characters.count ?? 0)")
                    let json = JSON(data: data )
                    
                   // print("jsonData: \(jsonData)")
                    
                    let results = json["Results"]
                    
                    var fhemInfos = [FHEMInfo]()
                    
                    for (_,result) in results {

                        
                        var fhemInfo = FHEMInfo(name: result["Name"].stringValue)
                        
                        
                        
                        let internals = result["Internals"]
                            let def = internals["DEF"].stringValue
                            let name = internals["NAME"].stringValue
                            let nr = internals["NR"].stringValue
                            let state = internals["STATE"].stringValue
                            let type = internals["TYPE"].stringValue
                            fhemInfo.def = def
                            fhemInfo.name_internal = name
                            fhemInfo.def = def
                            fhemInfo.nr = nr
                            fhemInfo.state = state
                            fhemInfo.type = type

                        
                        let attributes = result["Attributes"]
                            let iodev = attributes["IODev"].stringValue
                            let group = attributes["group"].stringValue
                            let model = attributes["model"].stringValue
                            let room = attributes["room"].stringValue
                            fhemInfo.iodev = iodev
                            fhemInfo.group = group
                            fhemInfo.model = model
                            fhemInfo.room = room

                        
                        fhemInfos.append(fhemInfo)
                    }
                    
                    fhemInfos.sortInPlace({ $1.name > $0.name })
                    completion(fhemInfos, nil)
                }
                catch {
                    print("Error: \(error)")
                }
            }

            else {
                completion(nil,WebserviceError.DataEmptyError)
            }
        }
        task.resume()
        
        }
    
    
    func turnOn(fhem:FHEMInfo, completion: (String?,  ErrorType?) -> Void) {
        let deviceName = fhem.name
        assert(!deviceName.isEmpty)
        let urlString = "supermanager.noip.me:8083/fhem?cmd=set+\(deviceName)+on"
        
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



