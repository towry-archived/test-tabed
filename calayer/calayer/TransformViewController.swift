//
//  TransformViewController.swift
//  calayer
//
//  Created by towry on 27/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {
    
    var imageView1: UIImageView?
    var imageView2: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "transform"
        self.view.backgroundColor = UIColor.purple
        
        self.draw()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func draw() {
//        self.imageView1 = self.createImageView()
        self.imageView2 = self.createImageView()
        
//        // begin transform
////        var transform: CGAffineTransform? = nil
//        var t = CGAffineTransform.identity
//        
//        // create transform
////        transform = CGAffineTransform(rotationAngle: 0.5)
//        t = t.translatedBy(x: 10, y: 10)
//        t = t.rotated(by: CGFloat.pi / 4)
//        t = t.scaledBy(x: -1, y: 2)
//        
//        // apply transform
////        self.imageView?.transform = transform!
//        self.imageView1?.transform = t
//        
//        self.imageView1?.isHidden = true
        
        // 3d transform
        var t2 = CATransform3DIdentity
        t2.m34 = -1.0 / 500
        CATransform3DRotate(t2, CGFloat.pi / 4, 0, 1, 0)
        self.imageView2?.layer.transform = t2
    }
    
    func createImageView() -> UIImageView {
        let img = UIImage(named: "0.jpeg")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: 40, y: 40, width: (img?.size.width)!, height: (img?.size.height)!)
        self.view.addSubview(imgView)
        return imgView
    }
}
