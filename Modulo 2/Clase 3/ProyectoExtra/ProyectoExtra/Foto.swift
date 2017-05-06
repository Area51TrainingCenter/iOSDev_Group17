//
//  Foto.swift
//  ProyectoExtra
//
//  Created by David Velarde on 5/5/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class Foto: NSObject {
    
    enum Estado {
        
        case nuevo
        case descargando
        case completo
        case error
        
    }
    
    var url = ""
    var estado : Estado = .nuevo
    var imagen : UIImage? = nil
    var bloqueCompletado : (()->Void)? = nil
    
    func descargar(item:Int){
        
        let dispatch = DispatchQueue(label:"Mi Thread \(item)", qos: .userInitiated)
        dispatch.async {
            
            let objetoURL = URL(string: self.url)!
            
            self.estado = .descargando

            if let dataDeImagen = try? Data(contentsOf: objetoURL) {
                let imageDeData = UIImage(data: dataDeImagen)
                self.imagen = imageDeData

                self.estado = .completo
                
                if self.bloqueCompletado != nil {
                    (self.bloqueCompletado)!()
                }
            }
            else{
                self.estado = .error
            }
            
        }
        
    }

}
