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
    
    var foto : UIImage? = nil
    
    var edad : Int {
        get {
            
            let fechaActual = Date()
            let segundosPorHora : Double = 3600
            let segundosPorDia : Double = segundosPorHora * 24
            let segundosPorAño : Double = segundosPorDia * 365
            
            let segundosHastaAhora = fechaActual.timeIntervalSince(self.fechaNacimiento)
            
            let edad = Int(segundosHastaAhora / segundosPorAño)
            
            return edad
        }
    }
    
    init(nombre: String, apellido: String, ocupacion: String, fechaNacimiento: Date, foto: UIImage?) {
        self.nombre = nombre
        self.apellido = apellido
        self.ocupacion = ocupacion
        self.fechaNacimiento = fechaNacimiento
        self.foto = foto
    }
    
    convenience init(nombre: String, apellido: String, ocupacion: String, fechaNacimiento: Date) {
        
        self.init(nombre: nombre, apellido: apellido, ocupacion: ocupacion, fechaNacimiento: fechaNacimiento, foto: nil)
    }
    
    convenience init(nombre:String, apellido:String, foto: UIImage) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let day = arc4random()%26 + 1
        let month = arc4random()%11 + 1
        let year = arc4random()%40 + 1955
        let stringDate = "\(day)-\(month)-\(year)"
        let date = formatter.date(from: stringDate)
        
        self.init(nombre: nombre, apellido: apellido, ocupacion: "Programador", fechaNacimiento: date!, foto: foto)
    }
    
    
}
