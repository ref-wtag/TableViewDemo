//
//  MyTableViewCell.swift
//  Contacts
//
//  Created by Refat E Ferdous on 22/11/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    
    public func configure(with title : String, imageName : String){
        myLable.text = title
        myImageView.image = UIImage(systemName: imageName)
    }
    
    @IBOutlet var myImageView : UIImageView!
    @IBOutlet var myLable : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
