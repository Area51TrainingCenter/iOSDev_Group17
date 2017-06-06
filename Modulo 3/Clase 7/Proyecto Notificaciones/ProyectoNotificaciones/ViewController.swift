//
//  ViewController.swift
//  ProyectoNotificaciones
//
//  Created by David Velarde on 6/5/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let token = Messaging.messaging().fcmToken
		print(token)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

