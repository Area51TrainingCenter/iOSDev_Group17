//: Playground - noun: a place where people can play

import Foundation

var entero : Int = 12
var numero : Double = 15

var texto : String = "Mi "
var texto2 = "nombre "
var texto3 = "es "
var texto4 = "David."

texto+texto2+texto3+texto4

var arrayCadena = [texto,texto2,texto3,texto4]

arrayCadena.count
arrayCadena.capacity
//var nombre = arrayCadena.popLast()
arrayCadena.count
arrayCadena

var rangoHasta5 = 0...5
var rangoHasta4 = 0..<5


for i in 0..<arrayCadena.count {
    
    let cadenaDeArray = arrayCadena[i]
    print(cadenaDeArray)
    
}


for i in 1...100 {
    
    if i%20 == 0 {
        print(i)
    }

}

var numeroMenorQue100 = 0

repeat {

    numeroMenorQue100+=10
    
} while numeroMenorQue100 < 100







