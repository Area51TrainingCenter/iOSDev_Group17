//
//  ViewController.swift
//  ProyectoSearch
//
//  Created by David Velarde on 5/8/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvTrabajadores: UITableView!
    
    var arrayTrabajadores = [Trabajador]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var arrayResultados = [Trabajador]()
    var estaBuscando = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        
        self.tvTrabajadores.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
        
        let faker = Faker(locale: "es")
        for _ in 0...50{
            
            arrayTrabajadores.append(Trabajador(nombre: faker.name.name(), trabajo: faker.company.name()))
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if estaBuscando{
            return arrayResultados.count
        }
        else{
            return arrayTrabajadores.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let trabajador = arrayTrabajadores[indexPath.row]
        
        var arrayABuscar : [Trabajador]
        
        if estaBuscando {
            arrayABuscar = arrayResultados
        }
        else{
            arrayABuscar = arrayTrabajadores
        }
        
        let trabajador = arrayABuscar[indexPath.row]
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellTrabajador") as? TrabajadorTableViewCell{
            cell.prepararVista(trabajador:trabajador)
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController : UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        
        estaBuscando = true
        
    }
    func willDismissSearchController(_ searchController: UISearchController) {
        estaBuscando = false
        tvTrabajadores.reloadData()
    }
}

extension ViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        arrayResultados = arrayTrabajadores.filter({ (objTrabajador) -> Bool in
            
            if let nombre = objTrabajador.nombre {
                if nombre.lowercased().contains(searchText.lowercased()) || searchText == "" {
                    return true
                }
            }
            
            return false
        })
        
        tvTrabajadores.reloadData()
        
    }

}
