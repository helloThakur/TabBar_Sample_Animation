//
//  MyTabBarController.swift
//  TabBarTest
//
//  Created by Ashutosh on 5/5/16.
//  Copyright © 2016 Verizon. All rights reserved.
//

import Foundation
import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        self.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let currentIndex = self.viewControllers?.indexOf(fromVC)
        let nextIndex = self.viewControllers?.indexOf(toVC)
        
        if currentIndex < nextIndex {
            return TRReverseAnimation(tabBarController: tabBarController, lastIndex: tabBarController.selectedIndex)
        }
        
        return TRAnimator(tabBarController: tabBarController, lastIndex: tabBarController.selectedIndex)
    }

    
    func tabBarController(tabBarController: UITabBarController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    deinit {
        print("de-init")
    }
}