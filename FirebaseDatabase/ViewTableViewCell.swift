//
//  ViewTableViewCell.swift
//  FirebaseDatabase
//
//  Created by Apogee on 6/21/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit

class ViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
