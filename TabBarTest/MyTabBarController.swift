//
//  MyTabBarController.swift
//  TabBarTest
//
//  Created by Ashutosh on 5/5/16.
//  Copyright © 2016 Verizon. All rights reserved.
//

import Foundation
import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let currentIndex = self.viewControllers?.index(of: fromVC)
        let nextIndex = self.viewControllers?.index(of: toVC)
        
        if currentIndex < nextIndex {
            return TRReverseAnimation(tabBarController: tabBarController, lastIndex: tabBarController.selectedIndex)
        }
        
        return TRAnimator(tabBarController: tabBarController, lastIndex: tabBarController.selectedIndex)
    }

    
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    deinit {
        print("de-init")
    }
}
