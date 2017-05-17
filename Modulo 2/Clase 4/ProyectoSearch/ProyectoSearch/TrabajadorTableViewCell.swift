//
//  TrabajadorTableViewCell.swift
//  ProyectoSearch
//
//  Created by David Velarde on 5/8/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class TrabajadorTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombre:UILabel!
    @IBOutlet weak var lblTrabajo:UILabel!
    @IBOutlet weak var imgFoto:UIImageView!
    
    func prepararVista(trabajador:Trabajador) {
        lblNombre.text = trabajador.nombre ?? "Sin nombre"
        lblTrabajo.text = trabajador.trabajo ?? "Sin trabajo"
        guard let foto = trabajador.foto else {
            imgFoto.backgroundColor = .black
            return
        }
        imgFoto.image = foto
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
