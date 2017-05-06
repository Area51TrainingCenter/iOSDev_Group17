//
//  ClienteCollectionViewCell.swift
//  RegistroClientes
//
//  Created by David Velarde on 5/5/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ClienteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCliente: UIImageView!
    @IBOutlet weak var lblCliente: UILabel!
    
    func prepararVista(cliente:Cliente){
        if let imagen = cliente.foto {
            imgCliente.image = imagen
        }
        lblCliente.text =
        "\(cliente.nombre) \(cliente.apellido) (\(cliente.edad))"
    }
    
}
