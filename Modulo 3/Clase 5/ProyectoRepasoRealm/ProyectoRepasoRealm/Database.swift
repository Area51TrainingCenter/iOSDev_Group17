//
//  Database.swift
//  ProyectoRepasoRealm
//
//  Created by David Velarde on 5/31/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import RealmSwift

class Database: NSObject {
    
    static func dameTodasLasMascotas()->[Mascota] {
        if let bd = try? Realm() {
            let arrayTemporal = bd.objects(Mascota.self)
            
            var arrayMascotas = [Mascota]()
            
            for resultado in arrayTemporal {
                arrayMascotas.append(resultado)
            }
            
            return arrayMascotas
        }
        else{
            return [Mascota]()
        }
    }

    static func agregaMascota(_ mascota:Mascota) {
        if let bd = try? Realm() {
            try? bd.write {
                bd.add(mascota)
            }
        }
    }
    
    static func editarMascotaConClosure( closure:()->Void ) {
        if let bd = try? Realm() {
            try? bd.write {
                //bd.add(mascota)
                closure()
            }
        }
    }
    
    static func eliminarMascota(_ mascota:Mascota){
        if let bd = try? Realm() {
            try? bd.write {
                bd.delete(mascota)
            }
        }
    }
    
}
