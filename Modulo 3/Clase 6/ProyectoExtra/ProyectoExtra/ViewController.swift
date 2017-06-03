//
//  ViewController.swift
//  ProyectoExtra
//
//  Created by David Velarde on 6/2/17.
//  Copyright © 2017 David Velarde. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var avPlayer : AVPlayer!
    var avPlayerLayer : AVPlayerLayer!
    
    var tituloBoton :String {
        get {
            return (pausa ? "Play":"Pausa")
        }
    }
    
    var pausa = true {
        willSet{
            print("Le puso " + tituloBoton)
        }
        didSet {
            if pausa {
                avPlayer.pause()
            } else {
                avPlayer.play()
            }
            btnPause.setTitle(tituloBoton, for: .normal)
        }
    }
    
    @IBOutlet weak var btnPause: UIButton!
    
    
    @IBAction func onClickPausa(_ sender: Any) {
        pausa = !pausa
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "video", withExtension: "mp4") {
        
            avPlayer = AVPlayer(url: url)
            avPlayer.actionAtItemEnd = .none
            avPlayer.volume = 0
            
            avPlayerLayer = AVPlayerLayer(player: avPlayer)
            avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            avPlayerLayer.frame = view.layer.bounds
            
            NotificationCenter.default.addObserver(self, selector: #selector(terminoElVideo(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
            
            view.layer.insertSublayer(avPlayerLayer, at: 0)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        avPlayer.play()
    }
    
    func terminoElVideo(notification:Notification){
        if let currentItem = notification.object as? AVPlayerItem {
            currentItem.seek(to: kCMTimeZero)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

