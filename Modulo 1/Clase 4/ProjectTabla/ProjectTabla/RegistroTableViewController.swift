//
//  RegistroTableViewController.swift
//  ProjectTabla
//
//  Created by David Velarde on 4/17/17.
//  Copyright © 2017 Jose Mejia. All rights reserved.
//

import UIKit

class RegistroTableViewController: UITableViewController {

    @IBOutlet weak var txtCelular: UITextField!
    
    @IBOutlet weak var txtApellido: UITextField!
    
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    
    
    @IBAction func onTouchUpInsideRegistrarme(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if txtCelular.text?.characters.count != 9 {
            
            let alertController = UIAlertController(title: "Error", message: "El celular no es valido", preferredStyle: .alert)
            
            alertController.addTextField(configurationHandler: { (txtNumeroAlerta) in
                txtNumeroAlerta.placeholder = "Ingresa tu numero celular"
                txtNumeroAlerta.tag = 9999
            })
            
            //let alertAction = UIAlertAction(title: "Ok", style: .default
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: { action in
                
//                if let txtNumeroAlerta = alertController.textFields?.first {
//                    self.txtCelular.text = txtNumeroAlerta.text
//                }
                
                if let arrayTextFields = alertController.textFields {
                    for txtRecorrido in arrayTextFields {
                        if txtRecorrido.tag == 9999 {
                            self.txtCelular.text = txtRecorrido.text
                        }
                    }
                }
                
                
                
            })
            
            
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            
            
            print("No tiene 9 caracteres!")
            
            return false
        }
        
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        
        if segue.identifier == "resultSegue"
        {
            if let resultVC = segue.destination as? ResultViewController {
                
                guard
                    
                    let nombre = txtNombre.text ,
                    
                    nombre.characters.count > 0 ,
                
                    let apellido = txtApellido.text ,
                
                    apellido.characters.count > 0 ,
                
                    let correo = txtCorreo.text ,
                
                    correo.characters.count > 0 ,
                    
                    let celular = txtCelular.text ,
                
                    celular.characters.count > 0
                
                else{
                        
                    resultVC.result = "Bienvenido Sin Nombre"
                    return
                }
                
                resultVC.result = "Bienvenido, \(nombre) \(apellido)\nTu correo es: \(correo)\nY tu celular es: \(celular)"
            
            }
        }
        
        // Pass the selected object to the new view controller.
     
        
     
     
    }
 

}
