//
//  TRCustomNavTransitionAnimator.swift
//  Traveler
//
//  Created by Ashutosh on 4/26/16.
//  Copyright © 2016 Forcecatalyst. All rights reserved.
//

import Foundation
import UIKit

class TRAnimator: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private let ANIMATION_DURATION = 0.35
    var transitionInProgress:Bool = false
    var tabBarController: UITabBarController!
    var lastIndex = 0
    
    init(tabBarController: UITabBarController, lastIndex: Int) {
        self.tabBarController = tabBarController
        self.lastIndex = lastIndex
    }

    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return ANIMATION_DURATION
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        transitionContext.containerView()!.addSubview(toViewController.view)
        
        toViewController.view.alpha = 0.0
        UIView.animateWithDuration(ANIMATION_DURATION, animations: {
            toViewController.view.alpha = 1.0
            }, completion: { (finished) in
                
                fromViewController?.view.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
}

