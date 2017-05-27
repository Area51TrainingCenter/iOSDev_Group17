//
//  Persona.swift
//  ProyectoRealm
//
//  Created by David Velarde on 5/26/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import RealmSwift

class Persona: Object {
    
    dynamic var nombre = ""
    dynamic var apellido = ""
    dynamic var fechaNacimiento = ""
    dynamic var trabajo = ""
    
    func setFechaDeNacimiento(fechaNacimiento:Date){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.fechaNacimiento = formatter.string(from: fechaNacimiento)
    }
    
    func getFechaDeNacimiento()->Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: self.fechaNacimiento)!
    }

}
