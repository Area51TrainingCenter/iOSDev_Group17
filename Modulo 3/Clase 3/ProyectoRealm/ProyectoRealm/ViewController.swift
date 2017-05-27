//
//  ViewController.swift
//  ProyectoRealm
//
//  Created by David Velarde on 5/26/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvPersonas: UITableView!
    
    var personaSeleccionada : Persona?
    
    var dataSource : [Persona] {
        get {
            return BaseDeDatos.shared.listarPersonas()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvPersonas.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editar" {
            
            if let vc = segue.destination as? AgregarPersona {
                vc.personaDeLista = personaSeleccionada
            }
        
        }
        
    }
    
}


extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let persona = dataSource[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPersona") {
            cell.textLabel?.text = persona.nombre + " " + persona.apellido
            cell.detailTextLabel?.text = persona.trabajo
            return cell
        }
        return UITableViewCell()
    }

}

extension ViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let persona = dataSource[indexPath.row]
        
        self.personaSeleccionada = persona
        
        performSegue(withIdentifier: "editar", sender: self)
    }
    
}
