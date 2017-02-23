//
//  MainViewController.swift
//  test-tabed
//
//  Created by towry on 19/02/2017.
//  Copyright © 2017 towry. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ViewControllerSwitchDelegate {
    
    var visibleViewCtl: UIViewController?
    var rootNavigatorController: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationController()
        
//        self.presentDefaultView()
    }
    
    func setupNavigationController() {
        let rootViewController = DefaultViewController()
        rootViewController.delegate = self
        rootViewController.title = "first"
        rootViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: .done, target: self, action: #selector(presentAnotherView))
        rootNavigatorController = UINavigationController.init(rootViewController: rootViewController)
        rootNavigatorController?.view.translatesAutoresizingMaskIntoConstraints = true
        rootNavigatorController?.view.isOpaque = false
        self.addChildViewController(rootNavigatorController!)
        self.view.addSubview((rootNavigatorController?.view)!)
        rootNavigatorController?.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func presentDefaultView() {
//        let defaultView = DefaultViewController()
//        self.switchToViewController(viewController: defaultView, animated: false)
//    }
//    
    func presentAnotherView() {
//        let view = AnotherViewController()
//        self.switchToViewController(viewController: view, animated: true)
        
        if self.visibleViewCtl != nil && self.visibleViewCtl!.isKind(of: DefaultViewController.self) {
            let view = RootViewController()
            view.title = "chat"
            self.rootNavigatorController?.pushViewController(view, animated: true)
            self.visibleViewCtl = view
            return
        }
        NSLog("switch to default")
        let view = DefaultViewController()
        view.title = "setting"
        self.rootNavigatorController?.pushViewController(view, animated: true)
        self.visibleViewCtl = view
    }
//
//    func switchToViewController(viewController: UIViewController, animated: Bool) {
//        if (animated && self.visibleViewCtl != nil) {
//            self.visibleViewCtl?.dismiss(animated: false, completion: nil)
//            self.visibleViewCtl?.willMove(toParentViewController: nil)
//            self.addChildViewController(viewController)
//            
//            self.transition(from: self.visibleViewCtl!,
//                            to: viewController,
//                            duration: 0.5,
//                            options: UIViewAnimationOptions.transitionCrossDissolve,
//                            animations: nil,
//                            completion: { (finished: Bool) -> Void in
//                                viewController.didMove(toParentViewController: self)
//                                self.visibleViewCtl?.removeFromParentViewController()
//                                self.visibleViewCtl = viewController
//            })
//        } else {
//            UIView.performWithoutAnimation {
//                self.addChildViewController(viewController)
//                viewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//                self.view.addSubview(viewController.view)
//                viewController.didMove(toParentViewController: self)
//                self.visibleViewCtl = viewController
//            }
//        }
//    }
//    
    func subViewButtonClicked() {
        self.presentAnotherView()
    }
}
