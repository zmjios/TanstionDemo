//
//  GlobalAnimation.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/17.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class GlobalAnimation: BaseReversibleAnimation {
    
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning, fromVc: UIViewController, fromView: UIView, toVc: UIViewController, toView: UIView) {
        

        let containerView = transitionContext.containerView()!
    
        //2.addsubview
        if !self.reverse{
            containerView.addSubview(toView)
        }else
        {
            containerView.insertSubview(toView, belowSubview: fromView)
        }
        
        // parallax effect; the offset matches the one used in the pop animation in iOS 7.1
        if !self.reverse{
        
            fromView.alpha = 1
            
            toView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(toView.frame), 0)
            
        }else
        {
            let toViewControllerXTranslation:CGFloat = -CGRectGetWidth(containerView.bounds) * 0.3
            toView.transform = CGAffineTransformMakeTranslation(toViewControllerXTranslation, 0)
            toView.alpha = 0.5
        }
        
        
        //4.do animation
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            if !self.reverse{
                
                toView.transform = CGAffineTransformIdentity
                fromView.alpha = 0.5
                fromView.transform = CGAffineTransformMakeTranslation(-CGRectGetWidth(containerView.bounds) * 0.3, 0)
            }
            else
            {
                fromView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(toView.frame), 0)
                toView.alpha = 1
                toView.transform = CGAffineTransformIdentity
            }
            
            }, completion: {
                
                finish in
                
                fromView.transform = CGAffineTransformIdentity
                toView.transform = CGAffineTransformIdentity
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })

    }
    

}
