//
//  PostsViewController.swift
//  ProyectoServicios
//
//  Created by Admin on 17/05/17.
//  Copyright © 2017 Jose Mejia. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ChameleonFramework



class PostsViewController: UIViewController {

    
    var posts : [Post] = []
    
    @IBOutlet weak var tblPosts: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblPosts.estimatedRowHeight = 100
        tblPosts.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view.
        
        
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { (response) in
            
            switch response.result{
                
            case .success(let value):
                let json = JSON(value)
                let arrayJSON = json.arrayValue
                
                
                
                
                for jsonObject in arrayJSON{
                    let title = jsonObject["title"].stringValue
                    
                    let body =  jsonObject["body"].stringValue
                    
                    let post : Post =  Post(titulo: title, post: body)
                    
                    self.posts.append(post)
                    
                }
                
                
                self.tblPosts.reloadData()
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
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

}



extension PostsViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellPost", for: indexPath) as? PostTableViewCell{
            
            cell.lblTitulo.textColor = UIColor.flatGreen
            
            cell.lblTitulo.text = posts[indexPath.row].titulo
            cell.lblPost.text =  posts[indexPath.row].post
            
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    
    
    
    
}



