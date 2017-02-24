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
let names = ["layer demo1"]

class ViewController: UITableViewController {
    
    var detailViewCtl: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)
        
        splitViewController?.delegate = self
//        splitViewController?.preferredDisplayMode = .automatic
        
        title = "Master"
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewCtl = (controllers[controllers.count-1] as? UINavigationController)?.topViewController as? DetailViewController
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
//        let vc = SecondDetailViewController()
        let vc = self.detailViewCtl!
        self.showDetailViewController(vc, sender: nil)
    }
}


extension ViewController: UISplitViewControllerDelegate {
    
    // MARK: - split view delegate
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    // Restore navigation controller for iPhone 6 plus is rotated to landscape when the detail view controller is pushed in portrait.
    func splitViewController(splitViewController: UISplitViewController, separateSecondaryViewControllerFromPrimaryViewController primaryViewController: UIViewController!) -> UIViewController? {
        primaryViewController.separateSecondaryViewController(for: splitViewController)
        let navController = UINavigationController(rootViewController: detailViewCtl!)
        return navController
    }
}
