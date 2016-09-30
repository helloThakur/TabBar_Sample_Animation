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
    fileprivate let ANIMATION_DURATION = 0.35
    var transitionInProgress:Bool = false
    var tabBarController: UITabBarController!
    var lastIndex = 0
    
    
    init(tabBarController: UITabBarController, lastIndex: Int) {
        self.tabBarController = tabBarController
        self.lastIndex = lastIndex
    }

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return ANIMATION_DURATION
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        transitionContext.containerView.addSubview(toViewController.view)
        transitionContext.containerView.addSubview(fromViewController.view)
        
        fromViewController.view.frame = CGRect(x: 0, y: 0, width: fromViewController.view.frame.size.width, height: fromViewController.view.frame.size.height)
        UIView.animate(withDuration: ANIMATION_DURATION, animations: {
            fromViewController.view.frame = CGRect(x: 0, y: fromViewController.view.frame.size.height, width: fromViewController.view.frame.size.width, height: fromViewController.view.frame.size.height)
            }, completion: { (finished) in
                
                fromViewController.view.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
