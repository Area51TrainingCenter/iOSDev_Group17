//
//  ViewController.swift
//  ProyectoMapas
//
//  Created by David Velarde on 5/24/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    var lugarSeleccionado : Resultado!
    
    var arrayLocalizacion = [CLLocation]()
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        let location = CLLocationCoordinate2D(
            latitude: lugarSeleccionado.latitud,
            longitude: lugarSeleccionado.longitud )
        
        
        let camara = GMSCameraPosition.camera(withTarget: location, zoom: 20)
        
        let marker = GMSMarker(position: location)
        marker.title = lugarSeleccionado.nombre
        marker.snippet = lugarSeleccionado.direccion
        marker.map = self.mapView
        
        self.title = lugarSeleccionado.nombre
        
        //Empezamos a dibujar
        
        let path = GMSMutablePath()
        for localizacion in arrayLocalizacion {
            path.add(localizacion.coordinate)
        }
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .red
        polyline.strokeWidth = 2
        
        polyline.map = mapView
        
        mapView.camera = camara
        if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
            mapView.mapStyle = try? GMSMapStyle(contentsOfFileURL: styleURL)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

