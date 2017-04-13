//
//  ViewController.swift
//  ProyectoVC
//
//  Created by David Velarde on 4/12/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlets
    
    @IBOutlet weak var swPrimario: UISwitch!
    @IBOutlet weak var lblPrimario: UILabel!
    @IBOutlet weak var btnPrimario: UIButton!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var lblSaludo: UILabel!
    
    
    
    //IBAction
    
//    func nombreDeLaFuncion(parametro1:String, parametro2:Int) -> (String,Int) {
//        return (parametro1,parametro2)
//    }
    
//    func conGuion(_ parametro:String) {}
//    func sinGuion(conParametro parametro:String) {
//    }
    
    //self.sinGuion(conParametro: "asdas")
    //self.conGuion("Cadena de Texto")
    //self.sinGuion(parametro: "Cadena de Texto")
    //[self conGuion:@"Cadena de Texto"];
    //[self sinGuionWithParametro:@"Cadena de Texto"];
    
    @IBAction func onSwitchValueChange(_ sender: Any) {
        //Se actualice el texto del label
        //Se actualice el titulo del boton
        
        if self.swPrimario.isOn {
            self.lblPrimario.text = "Encendido"
            self.btnPrimario.setTitle("Apagar", for: .normal)
        }
        else{
            self.lblPrimario.text = "Apagado"
            self.btnPrimario.setTitle("Encender", for: .normal)
        }
        
        
        
        
    }
    @IBAction func onTouchUpInsideButton(_ sender: Any) {
        //Se actualice el texto del label
        //Se actualice el valor del Switch <-
        //Se actualice el texto del boton
        
        if self.swPrimario.isOn {
            self.swPrimario.isOn = false
            self.lblPrimario.text = "Apagado"
            self.btnPrimario.setTitle("Encender", for: .normal)
        }
        else{
            self.swPrimario.isOn = true
            self.lblPrimario.text = "Encendido"
            self.btnPrimario.setTitle("Apagar", for: .normal)
        }
        
    }
    
    @IBAction func onSegmentedValueChange(_ sender: Any) {
        
        //Sabemos que el sender es UISegmentedControl
        
        //let segmentedControl = sender as! UISegmentedControl
        
        
//        if let segmentedControl = sender as? UISegmentedControl
//        {
//            //Tiene exito y podemos acceder a las propiedades de segmenteControl como UISegmentedControl
//            let index = segmentedControl.selectedSegmentIndex
//            
//        }
        
        guard let segmentedControl = sender as? UISegmentedControl else{
            return
        }
        
        let index = segmentedControl.selectedSegmentIndex
        
        // 0 -> Español
        // 1 -> Ingles
        // 2 -> Italiano
        
        switch index {
        case 0:
            self.lblSaludo.text = "Hola " + (self.txtNombre.text ?? "").capitalized
        case 1:
            self.lblSaludo.text = "Hello " + (self.txtNombre.text ?? "").capitalized
        case 2:
            self.lblSaludo.text = "Ciao " + (self.txtNombre.text ?? "").capitalized
        default:
            break
        }
        
        
    }
    
    @IBAction func onSaludarTouchUpInside(_ sender: Any) {
    }

    override func viewDidLoad() {
//        self.btnPrimario.addTarget(self, action: #selector(onTouchUpInsideButton(_:)), for: .touchUpInside)
        
        self.view.backgroundColor = .black
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

