//
//  RootViewController.swift
//  test-tabed
//
//  Created by towry on 21/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.cyan
        
        let label = UILabel()
        label.text = "TrustIM Root View Controller"
        label.frame = CGRect(x: 30, y: 100, width: 100, height: 100)
        self.view.addSubview(label)
        
        self.title = "TrustIM"

        // Do any additional setup after loading the view.
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
