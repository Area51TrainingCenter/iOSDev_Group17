//
//  Mascota.swift
//  ProyectoRepasoRealm
//
//  Created by David Velarde on 5/31/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import RealmSwift

class Mascota: Object {
    
    dynamic var nombre = ""
    dynamic var raza = ""
    dynamic var fechaNacimiento : Date?

}
