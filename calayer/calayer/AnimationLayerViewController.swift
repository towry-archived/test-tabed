//
//  AnimationLayerViewController.swift
//  calayer
//
//  Created by towry on 27/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var colorLayer: CALayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Animation"
        self.view.backgroundColor = UIColor.white
        
        self.colorLayer = CALayer()
        self.colorLayer?.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
        self.colorLayer?.backgroundColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(self.colorLayer!)
        
        let btn = UIButton(type: .roundedRect)
        btn.frame = CGRect(x: 50.0,
                           y: 100.0 + 100.0 + 10.0,
                           width: 80.0,
                           height: 60.0)

        btn.setTitle("anime", for: .normal)
        btn.addTarget(self, action: #selector(anime), for: .touchDown)
        self.view.addSubview(btn)
    }
    
    func anime() {
        print("anime")
        let red = CGFloat(arc4random() / UInt32.max)
        let green = CGFloat(arc4random() / UInt32.max)
        let blue = CGFloat(arc4random() / UInt32.max)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        let anim = CABasicAnimation(keyPath: "backgroundColor")
        anim.toValue = color.cgColor
        anim.delegate = self
        self.colorLayer?.add(anim, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AnimationViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.colorLayer?.backgroundColor = (anim as! CABasicAnimation).toValue as! CGColor?
        CATransaction.commit()
    }
}
