//
//  ClienteTableViewCell.swift
//  RegistroClientes
//
//  Created by David Velarde on 4/28/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ClienteTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var lblOcupacion: UILabel!
    
    @IBOutlet weak var lblEdad: UILabel!
    
    func prepararVista(cliente:Cliente){
    
        lblNombre.text = "\(cliente.nombre) \(cliente.apellido)"
        lblOcupacion.text = "\(cliente.ocupacion)"
        lblEdad.text = "\(cliente.edad) años"
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
