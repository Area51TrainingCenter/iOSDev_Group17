//
//  FotoCollectionViewCell.swift
//  ProyectoExtra
//
//  Created by David Velarde on 5/5/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgFoto: UIImageView!
    
    func cargarImagen(imagen:UIImage){
        self.imgFoto.image = imagen
    }
    
}
