//
//  CustomDismissAnimation.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/12.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CustomDismissAnimation: NSObject,UIViewControllerAnimatedTransitioning {
    
    
    // This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
    // synchronize with the main animation.
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 0.4
    }
    
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        //1.从上下文中获取fromVc 和 toVc
        let fromVc:UIViewController? = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVc:UIViewController? = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        //2. 设置 fromVc的frame
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let initFrame:CGRect = transitionContext.initialFrameForViewController(fromVc!);
        let finalFrame:CGRect = CGRectOffset(initFrame, 0, screenBounds.size.height);
        
        // 3. 添加到containerView中
        let containerView:UIView = transitionContext.containerView()!;
        containerView.addSubview((toVc?.view)!)
        containerView.sendSubviewToBack((toVc?.view)!)
        
        // 4.
        let duration:NSTimeInterval = self.transitionDuration(transitionContext);
        
        UIView.animateWithDuration(duration, animations: {
            
            ()->Void in
            
            fromVc!.view.frame = finalFrame
            
            }, completion:{
                 Bool ->Void in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                
            }
        )
    }
    
    // This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
    func animationEnded(transitionCompleted: Bool)
    {
        print("aniantion finish")
    }


}
