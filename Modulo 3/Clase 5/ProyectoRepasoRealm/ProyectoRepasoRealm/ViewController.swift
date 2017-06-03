//
//  ViewController.swift
//  ProyectoRepasoRealm
//
//  Created by David Velarde on 5/31/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class ViewController: UIViewController {

    @IBOutlet weak var tvMascotas: UITableView!
    
    var mascotaSeleccionada : Mascota!
    
    var arrayMascotas : [Mascota] {
        get {
            return Database.dameTodasLasMascotas()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvMascotas.tableFooterView = UIView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        tvMascotas.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editar" {
            
            if let vc = segue.destination as? FormularioViewController {
                vc.mascotaRecibida = self.mascotaSeleccionada
            }
            
        }
        
        
    }


}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let mascota = arrayMascotas[indexPath.row]
        
        let accionDeBorrar = UITableViewRowAction(style: .destructive, title: "Matar") { (rowAction, indexPath) in
            Database.eliminarMascota(mascota)
            self.tvMascotas.deleteRows(at: [indexPath], with: .left)
        }
        return [accionDeBorrar]
        
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//        let mascota = arrayMascotas[indexPath.row]
//        
//        if editingStyle == .delete {
//            Database.eliminarMascota(mascota)
//            tvMascotas.deleteRows(at: [indexPath], with: .left)
//        }
//        
//    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        self.mascotaSeleccionada = arrayMascotas[indexPath.row]
        return indexPath
        
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayMascotas.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mascota = arrayMascotas[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celdaMascota") {
            cell.textLabel?.text = mascota.nombre
            cell.detailTextLabel?.text = mascota.raza
            return cell
        }
        else{
            return UITableViewCell()
        }
        
    }

}

extension ViewController : DZNEmptyDataSetSource {
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "Empieza agregando una mascota 🐒")
    }
}

