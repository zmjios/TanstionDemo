//
//  CustomCircleAnimation.swift
//  TanstionDemo
//
//  Created by 曾明剑 on 15/12/20.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CustomCircleAnimation: BaseReversibleAnimation {
    
    
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning, fromVc: UIViewController, fromView: UIView, toVc: UIViewController, toView: UIView) {
        
        
        let containerView = transitionContext.containerView()!
        let fromViewInitFrame = transitionContext.initialFrameForViewController(fromVc)
        let final_toVC_Center = toView.center
        let finalToViewFrmae = transitionContext.finalFrameForViewController(toVc)
        
        if !self.reverse{
            
            let rotation = CGAffineTransformMakeRotation(CGFloat(M_PI))
            fromView.frame = fromViewInitFrame;
            fromView.layer.anchorPoint = CGPointMake(0.5, 0.0)
            fromView.layer.position = CGPointMake(CGRectGetWidth(fromView.bounds), 0)
            
            //2.Insert the toVC view...........................
            containerView.insertSubview(toView, aboveSubview: fromView)
            
            toView.center = CGPointMake(-CGRectGetWidth(fromViewInitFrame), CGRectGetHeight(fromViewInitFrame))
            toView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/2))
            
            UIView.animateWithDuration(self.duration, animations: {
                
                
                fromView.transform = rotation
                toView.center = final_toVC_Center
                toView.transform = CGAffineTransformIdentity
                
                }, completion:{
                    
                    finished in
                    
                    fromView.transform = CGAffineTransformIdentity
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    
            })

            
        }else
        {
            
            let rotation = CGAffineTransformMakeRotation(CGFloat(M_PI))
            fromView.layer.anchorPoint = CGPointMake(0.5, 0.0)
            fromView.layer.position = CGPointMake(CGRectGetWidth(fromView.bounds), 0)
            
            containerView.insertSubview(toView, aboveSubview: fromView)
            
            toView.layer.anchorPoint = CGPointMake(0.5, 0.0);
            toView.layer.position = CGPointMake(CGRectGetWidth(toView.bounds), 0);
            toView.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI));
            

            UIView.animateWithDuration(self.duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 6, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                
                toView.frame = finalToViewFrmae
                fromView.transform = rotation
                toView.transform = CGAffineTransformIdentity
                
                }, completion: {
                    
                    finised in
                    
                    fromView.transform = CGAffineTransformIdentity
                    print(toView)
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    
            })

        }
    }

}
