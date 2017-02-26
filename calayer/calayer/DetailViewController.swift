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
        view.backgroundColor = UIColor.white
        
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        
        let img = UIImage(named: "0.jpeg")
        blueLayer.contents = img?.cgImage
        blueLayer.contentsGravity = kCAGravityCenter
        
        self.view.layer.addSublayer(blueLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
