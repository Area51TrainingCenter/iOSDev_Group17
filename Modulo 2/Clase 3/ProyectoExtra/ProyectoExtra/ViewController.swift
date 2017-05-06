//
//  ViewController.swift
//  ProyectoExtra
//
//  Created by David Velarde on 5/5/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...50 {
            let url = "https://randomuser.me/api/portraits/men/\(i).jpg"
            let foto = Foto()
            foto.url = url
            foto.bloqueCompletado = {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
            }
            arrayFotos.append(foto)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var arrayFotos = [Foto]()

}


extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayFotos.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotoCell", for: indexPath) as! FotoCollectionViewCell
        
        let objFoto = arrayFotos[indexPath.item]
        
        if objFoto.estado == .completo {
            cell.cargarImagen(imagen: objFoto.imagen!)
        }
        else{
            if objFoto.estado == .nuevo {
                objFoto.descargar(item: indexPath.item)
            }
        }
        
        return cell
        
        
    }
}

