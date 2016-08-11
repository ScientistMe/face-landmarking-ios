//
//  ViewController.swift
//  DisplayLiveSamples
//
//  Created by Luis Reisewitz on 15.05.16.
//  Copyright © 2016 ZweiGraf. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let sessionHandler = SessionHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        sessionHandler.openSession()
        

        let layer = sessionHandler.layer
        layer.frame = self.view.bounds
        layer.setAffineTransform(CGAffineTransformMakeRotation(CGFloat(M_PI)))
        layer.setAffineTransform(CGAffineTransformScale(layer.affineTransform(), 1, -1))
        self.view.layer.addSublayer(layer)
        
        view.layoutIfNeeded()

    }

}

