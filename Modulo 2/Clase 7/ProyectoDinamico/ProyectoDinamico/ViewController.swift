//
//  ViewController.swift
//  ProyectoDinamico
//
//  Created by David Velarde on 5/15/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import ChameleonFramework
import Cartography

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let tableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.view.backgroundColor = UIColor.flatGreen
//        
//        let lblTitulo = UILabel()
//        self.view.addSubview(lblTitulo)
//        lblTitulo.frame = CGRect(x: 10, y: 30, width: 300, height: 50)
//        lblTitulo.text = "Titulo"
//        
//        lblTitulo.font = UIFont(name: "HelveticaNeue", size: 25)!
//        lblTitulo.textAlignment = .center
//        
//        constrain(lblTitulo) { (lblTitulo) in
//            lblTitulo.top == (lblTitulo.superview?.top)! + 10
//            lblTitulo.leading == (lblTitulo.superview?.leading)! + 10
//            lblTitulo.trailing == (lblTitulo.superview?.trailing)! + 10
//            lblTitulo.height == 50
//            
//        }
        
        let navigationItem = UINavigationItem(title: "Movies 🎬")
        
        let navigationBar = UINavigationBar()
        navigationBar.items = [navigationItem]
        navigationBar.tintColor = UIColor.flatBlueDark
        self.view.addSubview(navigationBar)
        
        constrain(navigationBar) { (navBar) in
            if let superView = navBar.superview {
                navBar.leading == superView.leading
                navBar.top == superView.topMargin
                navBar.trailing == superView.trailing
                navBar.height == 60
            }
        }
        
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //OJO CON ESTO, SIRVE PARA QUE SI LA CELDA
        //NO PUEDE CALCULAR SU ALTURA EN BASE A CONSTRAINTS
        //NECESITA UN VALOR POR DEFECTO
        tableView.estimatedRowHeight = 120
        
        self.view.addSubview(tableView)
        
        constrain(tableView, navigationBar) { (tableView, navigationBar) in
            
            tableView.leading == (tableView.superview?.leading)!
            tableView.trailing == (tableView.superview?.trailing)!
            tableView.top == navigationBar.bottom
        }
        
        let tabBar = UITabBar()
        let movieItem = UITabBarItem(title: "🎬", image: nil, tag: 1)
        let searchItem = UITabBarItem(title: "🔎", image: nil, tag: 1)
        tabBar.items = [movieItem,searchItem]
        self.view.addSubview(tabBar)
        
        constrain(tabBar, tableView) { (tabBar, tableView) in
            if let superView = tabBar.superview {
                tabBar.bottom == superView.bottom
                tabBar.leading == superView.leading
                tabBar.trailing == superView.trailing
                tableView.bottom == tabBar.top
                tabBar.height == 50
            }
        }
        
        
//        constrain(self.tableView) { (tableview) in
//            tableview.leading == (tableview.superview?.leading)!
//            tableview.trailing == (tableview.superview?.trailing)!
//            tableview.top == (tableview.superview?.topMargin)!
//            tableview.bottom == (tableview.superview?.bottomMargin)!
//        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imagen1")
        cell.addSubview(imageView)
        constrain(imageView) { (image) in
            if let superView = image.superview {
                image.leading == superView.leading + 10
                image.width == 70
                image.height == 100
                image.top == superView.top + 10
            }
        }
        
        let lblTitle = UILabel()
        lblTitle.text = "Deadpool 2"
        lblTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        cell.addSubview(lblTitle)
        constrain(imageView, lblTitle) { (imageView,lblTitle) in
            if let superView = lblTitle.superview {
                lblTitle.leading == imageView.trailing + 10
                lblTitle.top == superView.top + 10
                lblTitle.height == 25
                lblTitle.trailing == superView.trailing - 10
            }
        }
        
        let lblOverview = UILabel()
        lblOverview.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        lblOverview.font = UIFont(name: "HelveticaNeue", size: 12)
        lblOverview.numberOfLines = 0
        cell.addSubview(lblOverview)
        constrain(lblTitle, lblOverview) { (lblTitle,lblOverview) in
            if let superView = lblOverview.superview {
                lblOverview.leading == lblTitle.leading
                lblOverview.top == lblTitle.bottom + 10
                lblOverview.bottom == superView.bottom - 10
                lblOverview.trailing == superView.trailing - 10
            }
        }
        
        //PARA LA CELDA PUEDA CALCULAR SU ALTURA
        //DEBE TENER LOS CONSTRAINTS ADECUADOS QUE ATEN
        //TANTO TOP COMO BOTTOM DE CELL
        
        return cell
        
    }
}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //PARA QUE LA CELDA SEA CAPAZ DE CALCULAR SU ALTURA
        //NECESITA QUE LE DEMOS ESTE VALOR A SU ALTURA
        return UITableViewAutomaticDimension
        
    }

}
