//
//  PopAnimation.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/15.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class PopAnimation: NSObject,UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //1.
        let fromVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containerView = transitionContext.containerView()!
        let fromView:UIView = (fromVc?.view)!
        let toView:UIView =  (toVc?.view)!
        
        
        //2.addsubview
        containerView.insertSubview(toView, belowSubview: fromView)
        
        // parallax effect; the offset matches the one used in the pop animation in iOS 7.1
        let toViewControllerXTranslation:CGFloat = -CGRectGetWidth(containerView.bounds) * 0.3;
        toView.transform = CGAffineTransformMakeTranslation(toViewControllerXTranslation, 0);
        toView.alpha = 0.5
        
        
        //4.do animation
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            fromView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(toView.frame), 0)
            toView.alpha = 1
            toView.transform = CGAffineTransformIdentity
            
            
            }, completion: {
                
                finish in
                
                fromView.transform = CGAffineTransformIdentity
                toView.transform = CGAffineTransformIdentity
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
        
    }

}
