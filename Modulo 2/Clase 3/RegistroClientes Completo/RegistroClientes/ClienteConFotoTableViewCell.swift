//
//  ClienteConFotoTableViewCell.swift
//  RegistroClientes
//
//  Created by David Velarde on 5/3/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ClienteConFotoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var lblOcupacion: UILabel!
    
    @IBOutlet weak var lblEdad: UILabel!
    
    @IBOutlet weak var imgFoto : UIImageView!
    
    func prepararVista(cliente:Cliente){
        
        imgFoto.layer.cornerRadius = (imgFoto.frame.width / 2)
        
        lblNombre.text = "\(cliente.nombre) \(cliente.apellido)"
        lblOcupacion.text = "\(cliente.ocupacion)"
        lblEdad.text = "\(cliente.edad) años"
        if let foto = cliente.foto {
            imgFoto.image = foto
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
