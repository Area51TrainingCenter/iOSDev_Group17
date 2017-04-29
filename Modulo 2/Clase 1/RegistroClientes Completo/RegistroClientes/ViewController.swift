//
//  ViewController.swift
//  RegistroClientes
//
//  Created by David Velarde on 4/24/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblApellido: UILabel!
    
    @IBOutlet weak var lblEdad: UILabel!
    @IBOutlet weak var lblOcupacion: UILabel!
    
    @IBOutlet weak var lblFechaActual: UILabel!
    
    var clienteRecibido : Cliente? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        if clienteRecibido != nil {
            self.lblNombre.text = clienteRecibido!.nombre
            self.lblApellido.text = clienteRecibido!.apellido
            self.lblOcupacion.text = clienteRecibido!.ocupacion
            
            let fechaActual = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            self.lblFechaActual.text = formatter.string(from: fechaActual)
            
            self.lblEdad.text = "\(clienteRecibido!.edad) años"
            
            
        
        
        }
    }
    
    @IBAction func onGuardar(_ sender: Any) {
        
        if let navigationPrincipal = self.navigationController?.presentingViewController as? UINavigationController
        {
            
            if let clientesVC = navigationPrincipal.topViewController as? ClientesViewController{
            
                //clientesVC.arrayClientes.append(clienteRecibido!)
                clientesVC.agregarCliente(cliente: clienteRecibido!)
                self.navigationController?.dismiss(animated: true, completion: nil)
            
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

