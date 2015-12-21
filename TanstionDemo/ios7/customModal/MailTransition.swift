//
//  MailTransition.swift
//  InfiniteScrollView
//
//  Created by zmjios on 15/12/21.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class MailTransition: BaseReversibleAnimation{
    
    
    var fromSnapShot:UIView?
    
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning, fromVc: UIViewController, fromView: UIView, toVc: UIViewController, toView: UIView) {
        
        
        let containerView = transitionContext.containerView()!
        let toViewFinalFrame = transitionContext.finalFrameForViewController(toVc)
        
    
        if !self.reverse{
            
            let snapShot = fromView.snapshotViewAfterScreenUpdates(false)
            self.fromSnapShot = snapShot
            
            toView.frame = CGRectMake(0, CGRectGetHeight(fromView.bounds), CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
            containerView.addSubview(toView)
            
            //add snapshot ,beacuse fromView will be remove by system when present finished
            containerView.insertSubview(snapShot, belowSubview: toView)
//            fromView.hidden = true
            
            fromView.transform = CGAffineTransformIdentity
            snapShot.transform = CGAffineTransformIdentity
            snapShot.alpha =  1
            
            UIView.animateWithDuration(self.duration, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                
                
                fromView.transform = CGAffineTransformMakeScale(0.9, 0.9)
                snapShot.transform = CGAffineTransformMakeScale(0.9, 0.9)
                snapShot.alpha = 0.9
                toView.frame = CGRectOffset(toViewFinalFrame, 0, 44)
                
                }, completion: {
                    
                    
                    finished in
                    
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    
                    
            })
            
        }else
        {
            
            toView.transform = CGAffineTransformMakeScale(0.9, 0.9)
            toView.alpha = 0.9
            containerView.insertSubview(toView, belowSubview: fromView)
            
            self.fromSnapShot?.hidden = true
            
            UIView.animateWithDuration(self.duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                
                toView.transform = CGAffineTransformIdentity
                toView.alpha = 1
                toView.transform = CGAffineTransformIdentity
                fromView.frame = CGRectMake(0, CGRectGetHeight(fromView.bounds), CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
                
                
                }, completion: {
                    (finished) -> Void in
                    
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    
                    if transitionContext.transitionWasCancelled(){
                        
                        self.fromSnapShot?.hidden = false
                        containerView.insertSubview(toView, belowSubview: self.fromSnapShot!)
                        toView.alpha = 1.0
                        toView.transform = CGAffineTransformMakeScale(0.9, 0.9)
                    }else
                    {
                        fromView.removeFromSuperview()
                        self.fromSnapShot!.removeFromSuperview()
                    }
                    
            })
            
            
            
            
            
        }
    }
    

}
