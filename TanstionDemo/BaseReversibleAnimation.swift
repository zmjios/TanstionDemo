//
//  BaseReversibleAnimation.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/17.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class BaseReversibleAnimation: NSObject,UIViewControllerAnimatedTransitioning{
    
    var reverse:Bool =  false
    
    var duration:NSTimeInterval = 0.3
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return self.duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromView:UIView = fromVc.view
        let toView:UIView =  toVc.view
        
        
        animateTransition(transitionContext, fromVc: fromVc, fromView: fromView, toVc: toVc, toView: toView)
    }
    
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning,fromVc:UIViewController,fromView:UIView,toVc:UIViewController,toView:UIView){
        
        
    }

}
