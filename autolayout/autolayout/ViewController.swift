//
//  ViewController.swift
//  autolayout
//
//  Created by towry on 01/03/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var anotherCtl: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let anotherCtl = AnotherController()
        let navCtl = UINavigationController(rootViewController: anotherCtl)
        navCtl.view.translatesAutoresizingMaskIntoConstraints = true
        navCtl.view.isOpaque = false
        
        print("about to add child ctl")
        
        self.addChildViewController(navCtl)
        
        print("child ctl added")
        
        self.view.addSubview(navCtl.view)
        
        print("ctl view is added as subview")
        
        navCtl.didMove(toParentViewController: self)
        
        print("didMove called")
        
        self.anotherCtl = anotherCtl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        print("view is about to change\(self.view.bounds) - \(self.anotherCtl!.view.bounds)")
    }
    
    override func viewDidLayoutSubviews() {
        print("view is already changed\(self.view.bounds) - \(self.anotherCtl!.view.bounds)")
    }
}

let kMenuItemCount = 7

class AnotherController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.gray
        
        let tv = UITableView(frame: self.view.bounds)
        tv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tv.backgroundColor = UIColor.white
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        self.tableView = tv
        self.view.addSubview(tv)
        
        print("2 another view loaded \(self.view.bounds)")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kMenuItemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
            cell?.textLabel?.textAlignment = .center
            cell?.textLabel?.textColor = .white
            cell?.textLabel?.text = "hi"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(80, self.view.bounds.height / CGFloat(kMenuItemCount))
    }
}
