//
//  BaseDeDatos.swift
//  ProyectoRealm
//
//  Created by David Velarde on 5/26/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import RealmSwift

class BaseDeDatos: NSObject {
    
    static let shared = BaseDeDatos()
    
    private override init() {
        
    }
    
    
    
    func listarPersonasCon(nombre:String)->[Persona]{
        
        if let bd = try? Realm() {
            let results = bd.objects(Persona.self).filter({ (persona) -> Bool in
                return (persona.nombre.contains(nombre) || persona.apellido.contains(nombre))
            })
            
            var arrayPersonas = [Persona]()
            for result in results {
                arrayPersonas.append(result)
            }
            return arrayPersonas
        }
        return [Persona]()
        
    }
    
    func listarPersonas()->[Persona]{
        
        if let bd = try? Realm() {
            let results = bd.objects(Persona.self)
            var arrayPersonas = [Persona]()
            for result in results {
                arrayPersonas.append(result)
            }
            return arrayPersonas
        }
        return [Persona]()
        
    }
    func agregarPersona(persona:Persona){
        if let bd = try? Realm() {
            try? bd.write {
                bd.add(persona)
            }
        }
    }
    
    func actualizarPersona( edicion:(()->Void) ){
        if let bd = try? Realm() {
            try? bd.write {
                edicion()
            }
        }
    }
}
