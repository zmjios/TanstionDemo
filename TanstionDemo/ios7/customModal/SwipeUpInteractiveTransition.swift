//
//  SwipeUpInteractiveTransition.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/12.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class SwipeUpInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var interacting:Bool = false
    
    private var presentingController:UIViewController?
    
    private var shouldComplete:Bool = false
    
    init(presentController:UIViewController){
        
        super.init()
        
        self.presentingController = presentController
        
        let panGesture:UIPanGestureRecognizer  = UIPanGestureRecognizer.init(target: self, action: "gestureAction:")
        self.presentingController!.view.addGestureRecognizer(panGesture)
        
    }
    
    
    func gestureAction(panGesture:UIPanGestureRecognizer){
        
        
        let translation:CGPoint = panGesture.translationInView(panGesture.view?.superview)
        
        switch(panGesture.state)
        {
            
        case UIGestureRecognizerState.Began:
            
            self.interacting = true
            self.presentingController?.dismissViewControllerAnimated(true, completion: nil)
            break
            
        case UIGestureRecognizerState.Changed:
            //计算百分比，如果超过40%，则dismiss
            let fraction:CGFloat = translation.x / UIScreen.mainScreen().bounds.size.height
            let fr:Float = fminf(fmaxf(Float(fraction), 0.0), 1.0)
            self.shouldComplete = fr >= 0.40
            
            let cgfraction:CGFloat = CGFloat(fr)
            
            self.updateInteractiveTransition(cgfraction)
            
            break
            
        case UIGestureRecognizerState.Ended,UIGestureRecognizerState.Cancelled:
            
            self.interacting = false
            if (!self.shouldComplete || panGesture.state == UIGestureRecognizerState.Cancelled)
            {
                self.cancelInteractiveTransition()
            }else
            {
                self.finishInteractiveTransition()
            }
            
            break
            
        default:
            break
            
        }
        
    }

}
