//
//  Person.swift
//  TableSearch
//
//  Created by David Velarde on 11/14/16.
//  Copyright © 2016 Diloo. All rights reserved.
//

import UIKit

class Person {
    
    
    var name = ""
    var age = 0
    var photoURL = "http://lorempixel.com/200/200/"
    var photo : UIImage?
    var status = "Life is short"
    
    
    
    init(name:String, age:Int, status:String){
        
        self.name = name
        self.age = age
        self.status = status
    
    }

}
