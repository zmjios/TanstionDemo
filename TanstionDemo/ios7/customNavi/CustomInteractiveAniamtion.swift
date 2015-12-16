//
//  CustomInteractiveAniamtion.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/12.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CustomInteractiveAniamtion: UIPercentDrivenInteractiveTransition {
    
    var navigationController: UINavigationController!
    var shouldComplete = false
    var interacting = false
    
    
    var completionSeed: CGFloat {
        return 1 - percentComplete
    }
    

    init(navi:UINavigationController) {
        
        super.init()
        self.navigationController = navi
        
        let panGesture:UIPanGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: "handleGesture:")
        self.navigationController.view.addGestureRecognizer(panGesture)
    }
    
    func handleGesture(gesture:UIPanGestureRecognizer){
        
        let translation = gesture.translationInView(gesture.view?.superview)
        switch (gesture.state){
            
        case UIGestureRecognizerState.Began:
            interacting = true
            self.navigationController.popViewControllerAnimated(true)
            break
            
        case UIGestureRecognizerState.Changed:
            
            let percent = CGFloat(fminf(fmaxf(Float(translation.x / 200.0), 0.0), 1.0))
            shouldComplete = percent >= 0.5
            self.updateInteractiveTransition(percent)
             break
            
        case UIGestureRecognizerState.Ended,UIGestureRecognizerState.Cancelled:
            
            if (!shouldComplete || gesture.state == UIGestureRecognizerState.Cancelled){
                
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
