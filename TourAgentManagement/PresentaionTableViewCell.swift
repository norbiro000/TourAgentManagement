//
//  PresentaionTableViewCell.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/5/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit

class PresentaionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var background_label: UIView!
    @IBOutlet weak var img_background: UIImageView!
    @IBOutlet weak var lb_title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
