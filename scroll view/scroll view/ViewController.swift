//
//  ViewController.swift
//  scroll view
//
//  Created by towry on 27/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Master"
        self.view.backgroundColor = UIColor.white

        let sv = UIScrollView(frame: self.view.bounds)
        sv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(sv)
        sv.backgroundColor = .white
        
        var y: CGFloat = 10.0
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.text = "This is label \(i+1)"
            lab.sizeToFit()
            lab.frame.origin = CGPoint(x: 10, y: y)
            sv.addSubview(lab)
            y += lab.bounds.size.height + 10.0
        }
        var sz = sv.bounds.size
        sz.height = y
        sv.contentSize = sz
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

