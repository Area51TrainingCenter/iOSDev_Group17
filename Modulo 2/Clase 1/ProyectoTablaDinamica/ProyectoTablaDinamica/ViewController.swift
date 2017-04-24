//
//  ViewController.swift
//  ProyectoTablaDinamica
//
//  Created by David Velarde on 4/21/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "pruebaCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        cell?.textLabel?.text = "Celda \(indexPath.row)"
        print("Celda \(indexPath.row)")
        return cell!
    }

}















