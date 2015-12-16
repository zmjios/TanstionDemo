//
//  PushAnimation.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/15.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class PushAnimation: NSObject,UIViewControllerAnimatedTransitioning{


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
        //toView.frame = CGRectMake(CGRectGetWidth(fromView.bounds), 0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
        toView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(fromView.bounds), 0)
        toView.addLeftSideShadowWithFading()
        

        
        //2.addsubview
        containerView.addSubview(toView)
        fromView.alpha = 1
        
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            
            toView.transform = CGAffineTransformIdentity
            fromView.alpha = 0.5
            fromView.transform = CGAffineTransformMakeTranslation(-CGRectGetWidth(fromView.bounds), 0)
            
            
            }, completion: {
                
                finish in
                

                fromView.transform = CGAffineTransformIdentity
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                
        })
        
    
    }
    
    
    
    func animationEnded(transitionCompleted: Bool) {
        
        
    }
    
    
    func calculateTransformFromStartFrame(startFrame:CGRect,endFrame:CGRect)->CGAffineTransform{
        
        let startCenter:CGPoint = CGPointMake(CGRectGetMidX(startFrame), CGRectGetMidY(startFrame))
        let endCenter:CGPoint = CGPointMake(CGRectGetMidX(endFrame), CGRectGetMidY(endFrame))
        let translateX:CGFloat = startCenter.x-endCenter.x
        let translateY:CGFloat = startCenter.y-endCenter.y
        let translateTransform:CGAffineTransform = CGAffineTransformMakeTranslation(translateX, translateY)
        
        return translateTransform

    }
    
    


}
