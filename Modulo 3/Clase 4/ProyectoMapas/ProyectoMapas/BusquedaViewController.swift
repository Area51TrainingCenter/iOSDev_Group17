//
//  BusquedaViewController.swift
//  ProyectoMapas
//
//  Created by David Velarde on 5/24/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import PermissionScope
import CoreLocation

struct Resultado {
    var nombre : String
    var direccion : String
    var latitud : Double
    var longitud : Double
}


class BusquedaViewController: UIViewController {

    @IBOutlet weak var tableViewResultados: UITableView!
    
    var localizacionActual : CLLocation?
    
    var arrayLocalizaciones = [CLLocation]()
    
    var arrayResultado = [Resultado]()
    var lugarSeleccionado : Resultado!
    var dataTask : URLSessionDataTask? = nil
    
    let scope = PermissionScope()
    let location = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        location.delegate = self
        
        scope.addPermission(LocationAlwaysPermission(), message: "Dame localizacion")
        
        scope.show(
            {
                finished, results in
                
                if let result = results.first {
                    
                    switch result.status {
                    case .authorized:
                        self.location.startUpdatingLocation()
                    default:
                        print("Mostrar error")
                    }
                    
                }
            }, cancelled: nil)
        
    }
    
    func obtenerResultados(query:String) {
        
        var latitud = 51.503186
        var longitud = -0.126446
        
        if let localizacionActual = self.localizacionActual {
            latitud = localizacionActual.coordinate.latitude
            longitud = localizacionActual.coordinate.longitude
        }
        
        
        let urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(query)&location=\(latitud),\(longitud)&radius=1000&type=restaurant&key=\(GooglePlacesAPIKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = URL(string:urlString)!
        
        if self.dataTask != nil {
            self.dataTask?.cancel()
            self.dataTask = nil
        }
        arrayResultado.removeAll()
        tableViewResultados.reloadData()
        
        self.dataTask = URLSession.shared.dataTask(with:
            url) { (data, response, error) in
                
                if error == nil {
                    if let json = try? JSON(data: data!) {
                        let results = json["results"].arrayValue
                        for result in results {
                            let direccion = result["formatted_address"].stringValue
                            let nombre = result["name"].stringValue
                            let latitud = result["geometry"]["location"]["lat"].doubleValue
                            let longitud = result["geometry"]["location"]["lng"].doubleValue
                            
                            let resultado = Resultado(nombre: nombre, direccion: direccion, latitud: latitud, longitud: longitud)
                            
                            self.arrayResultado.append(resultado)
                        }
                        DispatchQueue.main.async {
                            self.tableViewResultados.reloadData()
                        }
                        
                    }
                }
                
        }
        dataTask?.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let vc = segue.destination as? ViewController{
            
            if segue.identifier == "recorrido" {
                vc.arrayLocalizacion = self.arrayLocalizaciones
                
                let result = Resultado(
                    nombre: "Mi Ruta",
                    direccion: "Direccion",
                    latitud: (localizacionActual?.coordinate.latitude)!,
                    longitud: (localizacionActual?.coordinate.longitude)!)
                
                vc.lugarSeleccionado = result
            }
            else{
                vc.lugarSeleccionado = self.lugarSeleccionado
            }
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}


extension BusquedaViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayResultado.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lugar = arrayResultado[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celdaLugar") {
            cell.textLabel?.text = lugar.nombre
            cell.detailTextLabel?.text = lugar.direccion
            return cell
        }
        
        
        return UITableViewCell()
    }
    
}

extension BusquedaViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        let lugar = arrayResultado[indexPath.row]
        self.lugarSeleccionado = lugar
        return indexPath
        
    }
    
}

extension BusquedaViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let query = searchText
        self.obtenerResultados(query: query)
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension BusquedaViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let localizacionActual = locations.first {
            if self.arrayLocalizaciones.count == 0 || localizacionActual.distance(from: self.localizacionActual!) > 1 {
                self.localizacionActual = localizacionActual
                arrayLocalizaciones.append(localizacionActual)
            }
            //self.localizacionActual = localizacionActual
        }
        
    }
    
    
}

