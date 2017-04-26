//
//  RegistroTableViewController.swift
//  RegistroClientes
//
//  Created by David Velarde on 4/24/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class RegistroTableViewController: UITableViewController {

    //Outlets
    
    var cliente : Cliente? = nil
    
    @IBOutlet weak var txtNombreApellido: UITextField!
    @IBOutlet weak var txtOcupacion: UITextField!
    @IBOutlet weak var txtFechaNacimiento: UITextField!
    
    @IBAction func onBotonGuardar(_ sender: Any) {
        
        let nombreApellido = txtNombreApellido.text
        let arrayNombre = nombreApellido?.components(separatedBy: " ")
        var error = false
        if(arrayNombre?.count == 2){
            let nombre = (arrayNombre?[0])!
            let apellido = (arrayNombre?[1])!
            
            if nombre.characters.count > 3 {
                if apellido.characters.count > 3 {
                    if txtOcupacion.text != nil && txtOcupacion.text != "" {
                        if txtFechaNacimiento.text != nil && txtFechaNacimiento.text != "" {
                            
                            self.cliente = Cliente(nombre: nombre, apellido: apellido, ocupacion: txtOcupacion.text!, fechaNacimiento: pickerFechaNacimiento.date)
                            
                            self.performSegue(withIdentifier: "mostrarCliente", sender: nil)
                            
                        }
                        else{
                            error = true
                        }
                    }
                    else{
                        error = true
                    }
                }
                else{
                    error = true
                }
            }
            else{
                error = true
            }
        }
        else{
            error = true
        }
        
        
        if error {
            let alertController = UIAlertController(title: "Error!", message: "Parece que alguno de los datos que ingreso es incorrecto", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    var pickerOcupacion = UIPickerView(frame: CGRect(x: 0, y: 0, width: 320, height: 150))
    var pickerFechaNacimiento = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 320, height: 200))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerOcupacion.backgroundColor = .white
        pickerOcupacion.dataSource = self
        pickerOcupacion.delegate = self

        self.txtOcupacion.inputView = pickerOcupacion
        
        self.agregarToolbarAOcupacion()
        
        //Minimo 18 años
        self.pickerFechaNacimiento.maximumDate = Date(timeIntervalSince1970: 925004823)
        self.pickerFechaNacimiento.datePickerMode = .date
        
        self.txtFechaNacimiento.inputView = pickerFechaNacimiento
        
        self.agregarToolbarAFechaNacimiento()
        
        self.pickerFechaNacimiento.addTarget(self, action: #selector(cambioFecha), for: .valueChanged)
        
    }
    func agregarToolbarAFechaNacimiento(){
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        let botonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapOnDoneFechaNacimiento))
        
        let botonFlexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([botonFlexible,botonDone], animated: true)
        
        self.txtFechaNacimiento.inputAccessoryView = toolbar
    }
    func agregarToolbarAOcupacion(){
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        let botonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapOnDone))
        
        let botonFlexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([botonFlexible,botonDone], animated: true)
        
        self.txtOcupacion.inputAccessoryView = toolbar
    }
    
    func cambioFecha(){
        let fechaNacimiento = self.pickerFechaNacimiento.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        self.txtFechaNacimiento.text = formatter.string(from: fechaNacimiento)
    }
    func tapOnDoneFechaNacimiento(){
        self.cambioFecha()
        self.txtFechaNacimiento.resignFirstResponder()
    }
    func tapOnDone(){
        let indice = pickerOcupacion.selectedRow(inComponent: 0)
        let texto = self.pickerView(pickerOcupacion, titleForRow: indice, forComponent: 0)
        self.txtOcupacion.text = texto
        self.txtOcupacion.resignFirstResponder()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destino = (segue.destination as! ViewController)
        destino.clienteRecibido = self.cliente
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}

extension RegistroTableViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
}

extension RegistroTableViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let texto = self.pickerView(pickerOcupacion, titleForRow: row, forComponent: 0)
        self.txtOcupacion.text = texto
        
    }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch row {
        case 0:
            return "Arquitecto"
        case 1:
            return "Programador"
        case 2:
            return "Diseñador"
        case 3:
            return "Heladero"
        case 4:
            return "Albañil"
        default:
            return ""
        }
        
    }
    
}










