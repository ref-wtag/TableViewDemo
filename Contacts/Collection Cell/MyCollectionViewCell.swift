//
//  MyCollectionViewCell.swift
//  Contacts
//
//  Created by Refat E Ferdous on 22/11/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myLabel : UILabel!
    @IBOutlet var myImageView : UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib () -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    public func configureWithModel(with model : Model){
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
        self.myImageView.contentMode = .scaleAspectFill
    }

}
