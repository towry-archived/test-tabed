//
//  MaskLayerViewController.swift
//  calayer
//
//  Created by towry on 26/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class MaskLayerViewController: UIViewController {
    
    var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        
        self.title = "mask layer"
        
        self.draw()

        // Do any additional setup after loading the view.
    }
    
    func draw() {
        self.addImage()
        self.setupMaskLayer()
    }
    
    func addImage() {
        let img = UIImage(named: "0.jpeg")
        let imgView = UIImageView(image: img)
        self.view.addSubview(imgView)
        self.imageView = imgView
    }
    
    func setupMaskLayer() {
        let layer = CALayer()
        layer.frame = (self.imageView?.bounds)!
        layer.contents = UIImage(named: "triangle.png")?.cgImage
        self.imageView?.layer.mask = layer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
