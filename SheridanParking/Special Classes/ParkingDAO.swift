//
//  ParkingDAO.swift
//  SheridanParking
//
//  Created by Xcode User on 2019-12-09.
//  Copyright © 2019 Inderpreet Singh. All rights reserved.
//

import UIKit

class ParkingDAO: NSObject {

    var parkingData : [NSDictionary]?
    let myUrl = "https://sing5745.dev.fast.sheridanc.on.ca/prog39856/insert_parking.php"
        
    enum JSONError : String, Error {
            case NoData = "Error: No Data"
            case ConversionFailed = "Error: conversion from JSON failed"
    }
        
    func inserParking(parking:Parking){
            
            let endPoint = URL(string: myUrl)
            var request = URLRequest(url: endPoint!)
            
            request.httpMethod = "POST"

            let dataString = parking.getDataString()
                
            URLSession.shared.uploadTask(with: request, from: dataString.data(using: .utf8)){
                (data, response, error) in
                
                do {
                  
                    guard let data = data else {
                        throw JSONError.NoData
                    }
                    
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary] else {
                        throw JSONError.ConversionFailed
                    }
                    print(json)
                    
                }catch let error as JSONError {
                    
                    print(error.rawValue)
                    
                }
                catch let error as NSError {
                    
                    print(error.debugDescription)
                    
                }
                
                
            }.resume()
            
            
        }
    
    func jsonParser(){
        
        let endPoint = URL(string: "https://sing5745.dev.fast.sheridanc.on.ca/prog39856/getParkings.php")
        let request = URLRequest(url: endPoint!)
        
        
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            
            do {
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(dataString!)
                
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary] else {
                    throw JSONError.ConversionFailed
                }
                print(json)
                self.parkingData = json
                
            }catch let error as JSONError {
                
                print(error.rawValue)
                
            }
            catch let error as NSError {
                
                print(error.debugDescription)
                
            }
            
            
        }.resume()
        
        
    }
    
    
        
    
}
