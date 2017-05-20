//
//  ViewController.swift
//  ProyectoServicios
//
//  Created by Admin on 17/05/17.
//  Copyright © 2017 Jose Mejia. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    
    var users : [User] = []
    
    
    @IBOutlet weak var tblUsers: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error{
                print("Hubo un error")
            }else{
                
                if let json = try? JSONSerialization.jsonObject(with: data!){
                    
                    
                    print(json)
                    
                    
                }
                
                
                
                print(data?.count)
            }
        }
        
        //dataTask.resume()
        
        
        
        
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON { (response) in
            
            switch response.result{
                
            case .success(let value):
                   let json = JSON(value)
                   let arrayJSON = json.arrayValue
                   
          
                  
                   
                    for jsonObject in arrayJSON{
                        let name = jsonObject["name"].stringValue
                        
                        let companyName =  jsonObject["company"]["name"].stringValue
                        
                        let user : User =  User(name: name, nameJob: companyName)
                        
                        self.users.append(user)
                        
                    }
                
                
                 self.tblUsers.reloadData()
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell{
            
     
             
          cell.lblNombre.text = users[indexPath.row].name
           cell.lblNombreEmpresa.text =  users[indexPath.row].nameJob
        
        
        return cell
            
        }
        
        return UITableViewCell()
    }
    
    
    
    
    
}


