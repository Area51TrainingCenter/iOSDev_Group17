//
//  FormularioViewController.swift
//  ProyectoRepasoRealm
//
//  Created by David Velarde on 5/31/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

import Eureka


class FormularioViewController: FormViewController {

    var mascotaRecibida : Mascota?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var seccionPrincipal = Section("Datos de la Mascota")
        //nombre
        var filaNombre = NameRow(tag: "nombre")
        filaNombre.title = "Nombre"
        filaNombre.placeholder = "Nombre de la Mascota"
        
        let filaRaza = NameRow(tag: "raza")
        filaRaza.title = "Raza"
        filaRaza.placeholder = "Raza de la Mascota"
        
        let filaNacimiento = DateRow(tag: "fechaNacimiento")
        filaNacimiento.title = "Fecha de Nacimiento"
        filaNacimiento.value = Date()
        
        if let _ = mascotaRecibida {
            filaNombre.value = mascotaRecibida?.nombre
            filaRaza.value = mascotaRecibida?.raza
            filaNacimiento.value = mascotaRecibida?.fechaNacimiento
        }
        
        let filaBoton = ButtonRow().onCellSelection { (_, _) in
            
            
            guard
            
            let nombre = self.form.rowBy(tag: "nombre") as? NameRow,
            let raza = self.form.rowBy(tag: "raza") as? NameRow,
            let fechaNacimiento = self.form.rowBy(tag: "fechaNacimiento") as? DateRow
            
            else {
                return
            }
            
            if self.mascotaRecibida == nil {
                let mascota = Mascota()
                mascota.nombre = nombre.value!
                mascota.raza = raza.value!
                mascota.fechaNacimiento = fechaNacimiento.value
                
                Database.agregaMascota(mascota)
            }
            else{
                Database.editarMascotaConClosure {
                    self.mascotaRecibida?.nombre = nombre.value!
                    self.mascotaRecibida?.raza = raza.value!
                    self.mascotaRecibida?.fechaNacimiento = fechaNacimiento.value
                }
            }
            
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
        filaBoton.title = "Guardar"
        
        seccionPrincipal += [filaNombre,filaRaza,filaNacimiento,filaBoton]
        
        form+=[seccionPrincipal]
        
        
        
        //raza
        //fecha nacimiento
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
