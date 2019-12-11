//
//  ViewController.swift
//  SheridanParking
//
//  Created by Xcode User on 2019-12-09.
//  Copyright © 2019 Inderpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfFirstName : UITextField!
    @IBOutlet var tfLastName : UITextField!
    @IBOutlet var tfEmail : UITextField!
    @IBOutlet var tfLicensePlate : UITextField!
    @IBOutlet var dtStartTime : UIDatePicker!
    @IBOutlet var dtEndTime : UIDatePicker!
    @IBOutlet var tfCreditCard : UITextField!
    @IBOutlet var tfCvcNumber : UITextField!
    
    @IBOutlet var insertButton : UIButton!

    
    @IBAction func addData(){
        
        let getData = ParkingDAO()
        
        let parking = Parking()
        
        parking.initWithData(
            firstName:tfFirstName.text!,
            lastName:tfFirstName.text!,
            email:tfFirstName.text!,
            licensePlate:tfFirstName.text!,
            startTime:parking.convertDateToTimeString(date: dtStartTime.date),
            endTime:tfFirstName.text!,
            creditCardNumber:tfFirstName.text!,
            cvcNumber: tfFirstName.text!)
    
        
        getData.jsonParser(parking: parking)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

