//
//  ClientesViewController.swift
//  RegistroClientes
//
//  Created by David Velarde on 4/28/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ClientesViewController: UIViewController {
    
    var arrayClientes = [Cliente]()
    
    var clienteSeleccionado : Cliente? = nil
    
    @IBOutlet weak var tableView : UITableView!
    
    func agregarCliente(cliente:Cliente){
        arrayClientes.append(cliente)
        
        //self.tableView.reloadData()
        //        UIView.animate(withDuration: 1, delay: 1, options: .allowAnimatedContent, animations: {
        //
        //        }) { (finished) in
        //            let indexPath = IndexPath(row: self.arrayClientes.count - 1, section: 0)
        //            self.tableView.insertRows(at: [indexPath], with: .left)
        //        }
        
        let indexPath = IndexPath(row: self.arrayClientes.count - 1, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .left)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayClientes.append(Cliente(nombre: "Juan", apellido: "Perez", ocupacion: "Heladero", fechaNacimiento: Date()))
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController = segue.destination as? ViewController {
        
            viewController.clienteRecibido = self.clienteSeleccionado
            viewController.puedeGuardar = false
            
        }
        
        
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
 
    
}

extension ClientesViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cliente = arrayClientes[indexPath.row]
        
        if cliente.foto != nil {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "celdaClienteConFoto") as? ClienteConFotoTableViewCell {
                
                cell.prepararVista(cliente: cliente)
                return cell
            }
        }
        else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "celdaCliente") as? ClienteTableViewCell {
                
                cell.prepararVista(cliente: cliente)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayClientes.count
    }
    
}

extension ClientesViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cliente = arrayClientes[indexPath.row]
        
        self.clienteSeleccionado = cliente
        
        self.performSegue(withIdentifier: "mostrarInfo", sender: self)

    }
    
}








