//
//  Parking.swift
//  SheridanParking
//
//  Created by Xcode User on 2019-12-09.
//  Copyright © 2019 Inderpreet Singh. All rights reserved.
//

import UIKit

class Parking: NSObject {
    
    var firstName : String?
    var lastName : String?
    var email : String?
    var licensePlate : String?
    var startTime: String?
    var endTime: String?
    var creditCardNumber: String?
    var cvcNumber: String?
    var campus: String?
    
    func initWithData( firstName:String,
                       lastName:String,
                       email:String,
                       licensePlate:String,
                       startTime:String,
                       endTime:String,
                       creditCardNumber:String,
                       cvcNumber: String,
                       campus: String)
    {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.licensePlate = licensePlate
        self.startTime = startTime
        self.endTime = endTime
        self.creditCardNumber = creditCardNumber
        self.cvcNumber = cvcNumber
        self.campus = campus
        
    }
    
    func getDataString() -> String {
        
        var dataString = ""

        dataString = dataString + "&first_name=\(self.firstName ?? "none")"
            + "&last_name=\(self.lastName ?? "wrong data")"
            + "&license_plate=\(self.licensePlate ?? "wrong data")"
            + "&email=\(self.email ?? "bad data")"
            + "&start_time=\(self.startTime ?? "bad data")"
            + "&end_time=\(self.startTime ?? "bad data")"
            + "&credit_number=\(self.creditCardNumber ?? "bad data")"
            + "&cvc_number=\(self.cvcNumber ?? "bad data")"
            + "&campus=\(self.campus ?? "bad data")"
        
        return dataString
    }
    
    func convertDateToTimeString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM HH:mm"
     
        return (dateFormatter.string(from: date))
        
    }
}
