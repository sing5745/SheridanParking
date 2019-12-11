//
//  DataTableViewController.swift
//  SheridanParking
//
//  Created by Xcode User on 2019-12-11.
//  Copyright © 2019 Inderpreet Singh. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {

    let parkingData = ParkingDAO()
    var timer : Timer!
    
    @IBOutlet var myTable : UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true)
        
        parkingData.jsonParser()
        
    }
    
    @objc func refreshTable(){
        if(parkingData.parkingData != nil)
        {
            if (parkingData.parkingData!.count > 0)
            {
                myTable.reloadData()
                timer.invalidate()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(parkingData.parkingData != nil){
            return parkingData.parkingData!.count
        }
        
        return 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : ParkingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as?
            ParkingTableViewCell ?? ParkingTableViewCell(style: .default, reuseIdentifier: "myCell")

        let rowData = parkingData.parkingData![indexPath.row] as NSDictionary

        
        cell.myName.text = rowData["first_name"] as? String
        cell.myEmail.text = rowData["email"] as? String

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        if let split = self.splitViewController {
//
//            let controllers = split.viewControllers
//            let detailViewController = controllers[controllers.count-1]
//            as? DetailsViewController
//
//            detailViewController?.updatePerson(getData: getData, select: indexPath.row)
//
//        }
        
    }
