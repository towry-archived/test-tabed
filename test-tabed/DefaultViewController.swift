//
//  DefaultViewController.swift
//  test-tabed
//
//  Created by towry on 19/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

var count = 0

class DefaultViewController: UIViewController {
    
    weak var delegate: ViewControllerSwitchDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        let btn = UIButton()
        btn.setTitle("Click to push", for: .normal)
        btn.frame = CGRect(x: 30, y: 100, width: 200, height: 40)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnClick), for: .touchDown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClick() {
        if self.delegate == nil {
            NSLog("nil delegate")
            return
        }
        count += 1
        
        if (self.delegate?.responds(to: Selector(("subViewButtonClicked"))))! {
            NSLog("clicked %d", count);
            self.delegate?.subViewButtonClicked()
        } else {
            NSLog("method not found")
        }
    }
}
