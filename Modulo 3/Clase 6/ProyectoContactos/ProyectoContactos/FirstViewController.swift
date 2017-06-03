//
//  FirstViewController.swift
//  ProyectoContactos
//
//  Created by David Velarde on 6/2/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

import Contacts

class FirstViewController: UIViewController {

    @IBOutlet weak var tvPersonas : UITableView!
    let administrador = CNContactStore()
    var arrayContactos = [CNContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let groups = try? administrador.containers(matching: nil) {
            
            let keys = [
                CNContactGivenNameKey,
                CNContactFamilyNameKey,
                CNContactEmailAddressesKey
            ] as [CNKeyDescriptor]
            
            for group in groups {
                if let arrayContactosTemporal =
                    
                    try? administrador.unifiedContacts(
                        matching: CNContact.predicateForContactsInContainer(withIdentifier: group.identifier),
                        keysToFetch: keys) {
                
                    arrayContactos.append(contentsOf: arrayContactosTemporal)
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension FirstViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayContactos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contacto = arrayContactos[indexPath.row]
        
        let nombre = contacto.givenName
        let apellido = contacto.familyName
        
        guard
            let correo = contacto.emailAddresses.first?.value else{
            return UITableViewCell()
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPersona") {
            cell.textLabel?.text = nombre + " " + apellido
            cell.detailTextLabel?.text = correo as String
            return cell
        }
        return UITableViewCell()
    }
    
}

