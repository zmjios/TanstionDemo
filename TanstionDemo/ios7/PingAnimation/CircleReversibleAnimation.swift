//
//  CircleReversibleAnimation.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/17.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CircleReversibleAnimation: BaseReversibleAnimation {
    
    var transitionContext:UIViewControllerContextTransitioning?
    
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning, fromVc: UIViewController, fromView: UIView, toVc: UIViewController, toView: UIView) {
        
        self.transitionContext = transitionContext
        
        let containerView = transitionContext.containerView()!
        
        //get the push and back button
        let pushButton:UIButton? = fromVc.customPushButton
        let backButton:UIButton? = fromVc.customBackButton
        
        
        //2.addsubview
        containerView.addSubview(toView)
        
        
        let maskLayer = CAShapeLayer()
        toView.layer.mask = maskLayer
        
        //3
        if pushButton != nil && !self.reverse{
            
            let circleMaskInitPath = UIBezierPath(ovalInRect: pushButton!.frame)
            let maxFarPoint = CGPointMake(pushButton!.center.x, pushButton!.center.y - CGRectGetMaxY(toView.bounds))
            let radius = sqrt(maxFarPoint.x * maxFarPoint.x + maxFarPoint.y*maxFarPoint.y)
            let circleMaskFinalPath = UIBezierPath(ovalInRect: CGRectInset(pushButton!.frame, -radius, -radius))
            
            
            maskLayer.path = circleMaskFinalPath.CGPath
            
            let maskLayerAnimation = CABasicAnimation(keyPath: "path")
            maskLayerAnimation.fromValue = circleMaskInitPath.CGPath
            maskLayerAnimation.toValue = circleMaskFinalPath.CGPath
            maskLayerAnimation.duration = self.transitionDuration(transitionContext)
            maskLayerAnimation.delegate = self;
            maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
            
        }else if backButton != nil && self.reverse{
            
            let maxFarPoint = CGPointMake(backButton!.center.x, backButton!.center.y - CGRectGetMaxY(toView.bounds))
            let radius = sqrt(maxFarPoint.x * maxFarPoint.x + maxFarPoint.y*maxFarPoint.y)
            let circleMaskInitPath = UIBezierPath(ovalInRect: CGRectInset(backButton!.frame, -radius, -radius))
            let circleMaskFinalPath = UIBezierPath(ovalInRect: backButton!.frame)
            
            maskLayer.path = circleMaskFinalPath.CGPath
            
            let maskLayerAnimation = CABasicAnimation(keyPath: "path")
            maskLayerAnimation.fromValue = circleMaskInitPath.CGPath
            maskLayerAnimation.toValue = circleMaskFinalPath.CGPath
            maskLayerAnimation.duration = self.transitionDuration(transitionContext)
            maskLayerAnimation.delegate = self;
            maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
        }else
        {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            toView.layer.mask = nil;
        }

    }
    
    
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextToViewControllerKey)?.view.layer.mask = nil
    }

}
