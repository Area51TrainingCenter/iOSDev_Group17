//
//  PostTableViewCell.swift
//  ProyectoServicios
//
//  Created by Admin on 17/05/17.
//  Copyright © 2017 Jose Mejia. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitulo: UILabel!
    
    
    @IBOutlet weak var lblPost: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
