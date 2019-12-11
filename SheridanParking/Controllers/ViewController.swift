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
        
        let parkingDAO = ParkingDAO()
        
        let parking = Parking()
        
        parking.initWithData(
            firstName:tfFirstName.text!,
            lastName:tfLastName.text!,
            email:tfEmail.text!,
            licensePlate:tfLicensePlate.text!,
            startTime:parking.convertDateToTimeString(date: dtStartTime.date),
            endTime:parking.convertDateToTimeString(date: dtEndTime.date),
            creditCardNumber:tfCreditCard.text!,
            cvcNumber: tfCvcNumber.text!)
        
        parkingDAO.inserParking(parking: parking)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

