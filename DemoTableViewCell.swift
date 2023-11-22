//
//  DemoTableViewCell.swift
//  Contacts
//
//  Created by Refat E Ferdous on 21/11/23.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet var mylabel : UILabel!
    @IBOutlet var myImageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
