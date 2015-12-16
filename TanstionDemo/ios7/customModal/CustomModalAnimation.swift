//
//  CustomModalAnimation.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/12.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CustomModalAnimation: NSObject,UIViewControllerAnimatedTransitioning {
    
    
    // This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
    // synchronize with the main animation.
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 0.5
    }
    
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        //1.从上下文中获取fromVc 和 toVc
        let fromVc:UIViewController? = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVc:UIViewController? = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        //2. 设置 toVc的frame，这里如果不设置，toVc的frame会不正常
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let finalFrame:CGRect = transitionContext.finalFrameForViewController(toVc!)
        
        print("finalFrame = ")
        print(finalFrame)
        
        toVc?.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height)
        
        print("toVc?.view.frame = ")
        print(toVc?.view.frame)
        
        //3 将toVc.view 添加到containerView
        let containerView:UIView = transitionContext.containerView()!
        containerView.addSubview((toVc?.view)!)
        
        
        print("containerView = ")
        print(containerView)
        print(containerView.subviews)
        

        //4 执行动画
        [UIView .animateWithDuration(self.transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
                ()->Void in
                toVc?.view.frame = finalFrame
            }, completion: {
                Bool in
                transitionContext.completeTransition(true)
        })]
        
    }
    
    // This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
    func animationEnded(transitionCompleted: Bool)
    {
        print("aniantion finish")
    }

}
