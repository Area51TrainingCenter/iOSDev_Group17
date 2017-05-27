//
//  AgregarPersona.swift
//  ProyectoRealm
//
//  Created by David Velarde on 5/26/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import Eureka

class AgregarPersona: FormViewController {

    var nombre = ""
    var apellido = ""
    var fechaNacimiento = Date()
    var trabajo = ""
    
    var personaDeLista : Persona?
    var formulario : Form?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        formulario = form +++ Section()
            <<< TextRow(){ row in
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                row.title = "Nombre"
                row.value = (personaDeLista != nil) ? personaDeLista?.nombre : ""
                row.placeholder = "Enter text here"
            }.onChange({ (textRow) in
                self.nombre = textRow.value ?? ""
            }).cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
            <<< TextRow(){ row in
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                row.title = "Apellido"
                row.placeholder = "Enter text here"
                row.value = (personaDeLista != nil) ? personaDeLista?.apellido : ""
            }.onChange({ (textRow) in
                self.apellido = textRow.value ?? ""
            }).cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
            <<< DateRow(){
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
                $0.title = "Fecha de Nacimiento"
                $0.value = (personaDeLista != nil) ?
                    personaDeLista?.getFechaDeNacimiento() : Date(timeIntervalSinceReferenceDate: 0)
            }.onChange({ (dateRow) in
                self.fechaNacimiento = dateRow.value ?? Date()
            })
            <<< TextRow(){ row in
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                row.title = "Trabajo"
                row.placeholder = "Enter text here"
                row.value = (personaDeLista != nil) ? personaDeLista?.trabajo : ""
            }.onChange({ (textRow) in
                self.trabajo = textRow.value ?? ""
            }).cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
        }
    }

    @IBAction func tapEnDone(_ sender: Any) {
        
        if let errors = formulario?.validate() {
            if errors.count > 0 {
                return
            }
        }
        
        if personaDeLista == nil {
        
            let persona = Persona()
            persona.nombre = nombre
            persona.apellido = apellido
            persona.trabajo = trabajo
            persona.setFechaDeNacimiento(fechaNacimiento: fechaNacimiento)
            
            BaseDeDatos.shared.agregarPersona(persona: persona)
            
        }
        else{
            
            BaseDeDatos.shared.actualizarPersona {
                personaDeLista?.nombre = nombre
                personaDeLista?.apellido = apellido
                personaDeLista?.trabajo = trabajo
                personaDeLista?.setFechaDeNacimiento(fechaNacimiento: fechaNacimiento)
            }
            
        }
        
        self.navigationController?.popViewController(animated: true)
        
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
