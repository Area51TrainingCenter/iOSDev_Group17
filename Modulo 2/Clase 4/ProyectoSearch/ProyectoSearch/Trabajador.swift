//
//  Trabajador.swift
//  ProyectoSearch
//
//  Created by David Velarde on 5/8/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class Trabajador: NSObject {
    
    var nombre : String?
    var trabajo : String?
    var foto : UIImage?
    
    init(nombre:String?, trabajo:String?) {
        self.nombre = nombre
        self.trabajo = trabajo
        let numero = arc4random()%15
        if let imagen = UIImage(named: "\(numero)") {
            self.foto = imagen
        }
    }

}
