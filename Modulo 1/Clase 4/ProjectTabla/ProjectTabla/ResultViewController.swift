//
//  ResultViewController.swift
//  ProjectTabla
//
//  Created by David Velarde on 4/19/17.
//  Copyright © 2017 Jose Mejia. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        lblResult.text = result
        
        super.viewWillAppear(animated)
        
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
