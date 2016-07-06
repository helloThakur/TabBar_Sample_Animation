//
//  TRReverseAnimation.swift
//  Traveler
//
//  Created by Ashutosh on 5/3/16.
//  Copyright © 2016 Forcecatalyst. All rights reserved.
//

import Foundation
import UIKit


class TRReverseAnimation: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
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
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        transitionContext.containerView()!.addSubview(toViewController.view)
        transitionContext.containerView()!.addSubview(fromViewController.view)
        
        fromViewController.view.frame = CGRectMake(0, 0, fromViewController.view.frame.size.width, fromViewController.view.frame.size.height)
        UIView.animateWithDuration(ANIMATION_DURATION, animations: {
            fromViewController.view.frame = CGRectMake(0, fromViewController.view.frame.size.height, fromViewController.view.frame.size.width, fromViewController.view.frame.size.height)
            }, completion: { (finished) in
                
                fromViewController.view.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
}