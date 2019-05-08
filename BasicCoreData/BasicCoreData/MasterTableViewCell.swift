//
//  TableViewCell.swift
//  BasicCoreData
//
//  Created by duycuong on 5/8/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var masterView: UIView!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var masterImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            masterView.backgroundColor = UIColor.cyan
        } else {
//            return
            masterView.backgroundColor = UIColor.groupTableViewBackground
        }
    }
    
}
