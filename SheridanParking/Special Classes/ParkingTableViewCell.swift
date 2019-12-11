//
//  ParkingTableViewCell.swift
//  SheridanParking
//
//  Created by Xcode User on 2019-12-11.
//  Copyright © 2019 Inderpreet Singh. All rights reserved.
//

import UIKit

class ParkingTableViewCell: UITableViewCell {

    @IBOutlet var myName: UILabel!
    @IBOutlet var myEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
