//
//  ViewController.swift
//  calayer
//
//  Created by towry on 24/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

let kScreenSize = UIScreen.main.bounds
let kCellId = "cellId"

// 
let names = [
    "layer demo1",
    "mask layer",
    "transform layer",
    "animation"
]

class ViewController: UITableViewController {
    
    var detailViewChoosed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("master loaded")
        
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)
        
        splitViewController?.delegate = self
        splitViewController?.preferredDisplayMode = .automatic
        
        title = "Master"
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: kCellId)!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: kCellId)
        }
        
        cell?.textLabel?.text = names[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    // MARK: - tableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("showDetailViewController")
        var vc: UIViewController? = nil
        if indexPath.row == 0 {
            vc = DetailViewController()
        } else if indexPath.row == 1 {
            vc = MaskLayerViewController()
        } else if indexPath.row == 2 {
            vc = TransformViewController()
        } else if indexPath.row == 3 {
            vc = AnimationViewController()
        }
        
        if vc != nil {
            vc?.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
            vc?.navigationItem.leftItemsSupplementBackButton = true
            let nv = UINavigationController(rootViewController: vc!)
            nv.navigationBar.isTranslucent = false
            self.showDetailViewController(nv, sender: nil)
            self.detailViewChoosed = true
        }

    }
}


extension ViewController: UISplitViewControllerDelegate {
    
    // MARK: - split view delegate
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return !self.detailViewChoosed
    }

}
