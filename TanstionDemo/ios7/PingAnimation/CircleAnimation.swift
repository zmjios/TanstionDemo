//
//  CircleAnimation.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/17.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CircleAnimation: NSObject,UIViewControllerAnimatedTransitioning{
    
    var transitionContext:UIViewControllerContextTransitioning?

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        self.transitionContext = transitionContext
        
        return 0.5
    }
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //1.
        let fromVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containerView = transitionContext.containerView()!
        let fromView:UIView = (fromVc?.view)!
        let toView:UIView =  (toVc?.view)!
        
        
        //get the push button
        let pushButton:UIButton? = fromVc?.customPushButton
        
    
        //2.addsubview
        containerView.addSubview(toView)
        
        //3
        if pushButton != nil{
            
            let circleMaskInitPath = UIBezierPath(ovalInRect: pushButton!.frame)
            let maxFarPoint = CGPointMake(pushButton!.center.x, pushButton!.center.y - CGRectGetMaxY(toView.bounds))
            let radius = sqrt(maxFarPoint.x * maxFarPoint.x + maxFarPoint.y*maxFarPoint.y)
            let circleMaskFinalPath = UIBezierPath(ovalInRect: CGRectInset(pushButton!.frame, -radius, -radius))
            
            
            let maskLayer = CAShapeLayer()
            maskLayer.path = circleMaskFinalPath.CGPath
            toView.layer.mask = maskLayer
            
            let maskLayerAnimation = CABasicAnimation(keyPath: "path")
            maskLayerAnimation.fromValue = circleMaskInitPath.CGPath
            maskLayerAnimation.toValue = circleMaskFinalPath.CGPath
            maskLayerAnimation.duration = self.transitionDuration(transitionContext)
            maskLayerAnimation.delegate = self;
            maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
        }
    
    }
    
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextToViewControllerKey)?.view.layer.mask = nil
    }

}
