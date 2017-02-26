//
//  DetailViewController.swift
//  calayer
//
//  Created by towry on 24/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("detail loaded")
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true

        title = "CALayer"
        view.backgroundColor = UIColor.gray
        
        let blueLayer = CALayer()

        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.delegate = self
        
        blueLayer.contentsGravity = kCAGravityCenter
        blueLayer.contentsScale = UIScreen.main.scale
        
        let redLayer = CALayer()
        redLayer.frame = CGRect(x: 55, y: 5, width: 50, height: 50)
        redLayer.backgroundColor = UIColor.red.cgColor
        redLayer.borderWidth = 2
        redLayer.borderColor = UIColor.brown.cgColor
        
        blueLayer.addSublayer(redLayer)
        
        self.view.layer.addSublayer(blueLayer)
        blueLayer.display()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DetailViewController: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(2.0)
        ctx.setStrokeColor(UIColor.green.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}
