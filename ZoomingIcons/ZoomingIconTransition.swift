//
//  ZoomingIconTransition.swift
//  ZoomingIcons
//
//  Created by Michael Reining on 2/20/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ZoomingIconViewControllerProtocol {
    optional func zoomingIconColoredViewForTransition(transition: ZoomingIconTransition) -> UIView!
    optional func zoomingIconImageViewForTransition(transition: ZoomingIconTransition) -> UIImageView!
}

class ZoomingIconTransition: NSObject, UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate {
    let kZoomingIconTransitionDuration: NSTimeInterval = 1
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return kZoomingIconTransitionDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        //Setup transition parameters
        let timeInterval = transitionDuration(transitionContext)
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        
        //Setup Animation
        containerView.addSubview(fromViewController.view)
        toViewController.view.alpha = 0
        containerView.addSubview(toViewController.view)
        
        //Perform Animation
        UIView.animateWithDuration(timeInterval, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allZeros,
            animations: { () -> Void in
                [self]
                toViewController.view.alpha = 1
            }, completion: {
                (finished) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if fromVC is ZoomingIconViewControllerProtocol &&
            toVC is ZoomingIconViewControllerProtocol {
                println("success")
                return self
        }
        else {
            return nil
        }
        
    }
    
}