//
//  ViewControllerNegro.swift
//  ProyectoVC
//
//  Created by David Velarde on 4/12/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ViewControllerNegro: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    var redValue : Double = 0
    var greenValue : Double = 0
    var blueValue : Double = 0
    
    func updateBackground() {
        let color = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        
        self.view.backgroundColor = color
    }
    
    @IBAction func sliderRed(_ sender: UISlider) {
        
        redValue = Double(sender.value/255.0)
        
        updateBackground()
    }
    @IBAction func sliderGreen(_ sender: UISlider) {
        
        greenValue = Double(sender.value/255.0)
        
        updateBackground()
    }
    @IBAction func sliderBlue(_ sender: UISlider) {
        
        blueValue = Double(sender.value/255.0)
        
        updateBackground()
    }

}
