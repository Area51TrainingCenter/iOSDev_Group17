//
//  Cliente.swift
//  RegistroClientes
//
//  Created by David Velarde on 4/24/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class Cliente: NSObject {

    var nombre : String
    var apellido : String
    var ocupacion : String
    var fechaNacimiento : Date
    
    init(nombre: String, apellido: String, ocupacion: String, fechaNacimiento: Date) {
        
        self.nombre = nombre
        self.apellido = apellido
        self.ocupacion = ocupacion
        self.fechaNacimiento = fechaNacimiento
        
    }
    
    
}
