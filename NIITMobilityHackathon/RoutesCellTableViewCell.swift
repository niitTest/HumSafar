//
//  RoutesCellTableViewCell.swift
//  NIITMobilityHackathon
//
//  Created by Rahul on 24/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class RoutesCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mode1: UIImageView!
    
    @IBOutlet weak var totalFare: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var mode3: UIImageView!
    @IBOutlet weak var mode2: UIImageView!
    @IBOutlet weak var mode4: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
