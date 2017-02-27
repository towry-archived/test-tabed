//
//  DrawLineView.swift
//  calayer
//
//  Created by towry on 27/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class DrawLineView: UIView {
    var path: UIBezierPath?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupPath()
    }
    
    func setupPath() {
        print("draw line view")
        
        self.path = UIBezierPath()
        self.path?.lineJoinStyle = .round
        self.path?.lineCapStyle = .round
        self.path?.lineWidth = 5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self)
            self.path?.move(to: point)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self)
            self.path?.addLine(to: point)
            self.setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        UIColor.clear.setFill()
        UIColor.red.setStroke()
        self.path?.stroke()
    }
}
