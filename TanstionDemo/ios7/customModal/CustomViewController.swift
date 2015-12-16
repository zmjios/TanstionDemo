//
//  CustomViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/12.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController,ModalViewControllerDelegate,UIViewControllerTransitioningDelegate{

    var presentAnimation:CustomModalAnimation!
    var interactiveAnimation:SwipeUpInteractiveTransition?
    var dismissAnimation:CustomDismissAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let button:UIButton = UIButton.init(type: UIButtonType.RoundedRect)
        button.setTitle("show modal vc", forState:UIControlState.Normal)
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        button.frame = CGRectMake(100, 100, UIScreen.mainScreen().bounds.size.width - 200, 44);
        self.view.addSubview(button)
        
        
        self.presentAnimation = CustomModalAnimation()
        self.dismissAnimation = CustomDismissAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func buttonClicked(sender:UIButton){
        
        let modalVc:ModalViewController = ModalViewController()
         modalVc.delegate = self
        let navi:UINavigationController  = UINavigationController.init(rootViewController: modalVc)
        navi.transitioningDelegate = self
        self.interactiveAnimation = SwipeUpInteractiveTransition.init(presentController: navi)
        self.presentViewController(navi, animated: true, completion: nil)
        
        
    
    }
    
    func modalViewControllerDismissed(modalVc: UIViewController)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        return self.presentAnimation
        
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return self.dismissAnimation
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        return nil
    }
    
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        
        return self.interactiveAnimation!.interacting ? self.interactiveAnimation:nil
    }
    
//    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?
//    {
//        return nil
//    }

}
