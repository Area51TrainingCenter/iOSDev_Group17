//
//  PersonCell.swift
//  TableSearch
//
//  Created by David Velarde on 11/14/16.
//  Copyright © 2016 Diloo. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var downloadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imgPhoto.layer.borderColor = UIColor.black.cgColor
        
        self.imgPhoto.layer.cornerRadius = 30
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.imgPhoto.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
                
                self.imgPhoto.layer.borderWidth = 3
                
                var frame = self.lblName.frame
                frame.origin.x =  frame.origin.x + 20;
                self.lblName.frame = frame
                
            })
            
        }
        else{
            UIView.animate(withDuration: 0.2, animations: {
                self.imgPhoto.transform = CGAffineTransform(rotationAngle: 0.0)
                self.imgPhoto.layer.borderWidth = 0
            })
        }
        // Configure the view for the selected state
    }

}
