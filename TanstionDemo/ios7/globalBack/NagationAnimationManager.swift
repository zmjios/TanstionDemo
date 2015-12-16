//
//  NagationAnimationManager.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/15.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class NagationAnimationManager: NSObject,UIGestureRecognizerDelegate,UINavigationControllerDelegate{
    
    var navigationController:UINavigationController
    var panGesture:CustomDirectionGestureRecognizer?
    var duringAnimation:Bool = false  //是否正在动画中
    var shouldComplete:Bool = false   //拖拽是否完成动画
    var pushAnimation:PushAnimation?
    var popAnimation:PopAnimation?
    var interactiveTransition:UIPercentDrivenInteractiveTransition?
    
    init(navi:UINavigationController) {
    
        self.navigationController = navi
        
        super.init()
        
        commonInit()
    }
    
    
    func commonInit(){
        
        panGesture = CustomDirectionGestureRecognizer.init(target: self,action:"handleGesture:")
        panGesture?.direction = [Directions.Left,Directions.Right]
        panGesture?.delegate = self
        self.navigationController.view.addGestureRecognizer(panGesture!)
        
        self.navigationController.delegate = self
        
        self.pushAnimation = PushAnimation()
        self.popAnimation = PopAnimation()
        
    }
    
    
    func handleGesture(gesture:CustomDirectionGestureRecognizer){
        
        
        let view:UIView = self.navigationController.view.superview!
        let translation = gesture.translationInView(view)
        
        switch(gesture.state){
            
        case UIGestureRecognizerState.Began:
            
            if self.interactiveTransition == nil{
                self.interactiveTransition = UIPercentDrivenInteractiveTransition()
                self.interactiveTransition?.completionCurve = UIViewAnimationCurve.Linear
            }
            
            if (self.navigationController.viewControllers.count > 1 && !self.duringAnimation){
                
                if gesture.dragDiretion == Directions.Right {
                    self.navigationController.popViewControllerAnimated(true)
                }else if gesture.dragDiretion == Directions.Left{
                    //获取当前的topViewController
                    let topViewController:UIViewController = self.navigationController.viewControllers.last!
                    let pushController:UIViewController? = topViewController.pushController
                    if (pushController != nil){
                        
                        self.navigationController.pushViewController(pushController!, animated: true)
                    }
                }
            }
            
            break;
            
        case  UIGestureRecognizerState.Changed:
            
            if gesture.dragDiretion == Directions.Right{
                
                //计算百分比，如果超过40%，则pop
                let fraction:CGFloat = translation.x / UIScreen.mainScreen().bounds.size.height
                let fr:Float = fminf(fmaxf(Float(fraction), 0.0), 1.0)
                self.shouldComplete = fr >= 0.40
                
                let cgfraction:CGFloat = CGFloat(fr)
                
                self.interactiveTransition!.updateInteractiveTransition(cgfraction)
                
            }else if gesture.dragDiretion == Directions.Left{
                
                
                let fraction:CGFloat = abs(translation.x) / UIScreen.mainScreen().bounds.size.height
                let fr:Float = fminf(fmaxf(Float(fraction), 0.0), 1.0)
                self.shouldComplete = fr >= 0.30
                
                let cgfraction:CGFloat = CGFloat(fr)
                
                self.interactiveTransition!.updateInteractiveTransition(cgfraction)
                
            }
            
            break;
            
            
        case UIGestureRecognizerState.Ended,UIGestureRecognizerState.Cancelled:
            
            if (!self.shouldComplete || panGesture!.state == UIGestureRecognizerState.Cancelled)
            {
                self.interactiveTransition!.cancelInteractiveTransition()
                self.duringAnimation = false
            }else
            {
                self.interactiveTransition!.finishInteractiveTransition()
            }
            
            //不知道为什么如果不设置为nil重新push会有问题
            self.interactiveTransition = nil
            
            break;
            
        default:
            break;
        }
        
        
    }
    
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.navigationController.viewControllers.count > 1{
            
            return true
        }
        
        return false
    }
    
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return operation == UINavigationControllerOperation.Push ? self.pushAnimation:self.popAnimation
    }
    
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactiveTransition
    }
    
    

    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        
        self.duringAnimation = animated
    }
    
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        self.duringAnimation = false
        
        if navigationController.viewControllers.count > 1{
            
            self.panGesture?.enabled = true
        }else
        {
            self.panGesture?.enabled = false
        }
    }

}
