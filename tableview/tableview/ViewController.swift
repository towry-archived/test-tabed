//
//  ViewController.swift
//  tableview
//
//  Created by towry on 23/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

let kScreenBounds = UIScreen.main.bounds
let kCellId = "cellId"

class ViewController: UIViewController {
    
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        self.title = "Home"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: .plain, target: nil, action: nil)
        
        self.setUpTableView()
    }
    
    func setUpTableView() {
        let tv = UITableView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: kScreenBounds.width, height: kScreenBounds.height - 150)), style: .plain)
        tv.backgroundColor = UIColor.white
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .singleLine
        
        self.tableView = tv
        self.view.addSubview(tv)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: kCellId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: kCellId)
        }
        
        cell?.textLabel?.text = String(indexPath.row)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return ceil(50.0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.text = "you selected!"
    }
}
