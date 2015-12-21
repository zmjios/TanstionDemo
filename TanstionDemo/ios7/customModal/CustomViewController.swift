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
    var rotationAnimation:CustomCircleAnimation!
    var mailAnimation:MailTransition!
    var segment:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "CustomViewController"
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let button:UIButton = UIButton.init(type: UIButtonType.RoundedRect)
        button.setTitle("show modal vc", forState:UIControlState.Normal)
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        button.frame = CGRectMake(100, 100, UIScreen.mainScreen().bounds.size.width - 200, 44);
        self.view.addSubview(button)
        
        self.segment = UISegmentedControl.init(items: ["custom1","custom2","custom3"])
        self.segment!.frame = CGRectMake(0, 0, 200, 36)
        self.segment!.selectedSegmentIndex = 0
        //self.segment!.addTarget(self, action: "segmentAction:", forControlEvents: UIControlEvents.ValueChanged)
        self.navigationItem.titleView = segment
        
        
        
        self.presentAnimation = CustomModalAnimation()
        self.dismissAnimation = CustomDismissAnimation()
        self.rotationAnimation = CustomCircleAnimation()
        self.rotationAnimation.duration = 1
        self.mailAnimation = MailTransition()
        
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
        self.interactiveAnimation = SwipeUpInteractiveTransition(presentController: navi)
        self.presentViewController(navi, animated: true, completion: nil)

    }
    
    func modalViewControllerDismissed(modalVc: UIViewController)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        if self.segment.selectedSegmentIndex == 0{
            
            return self.presentAnimation
        }else if self.segment.selectedSegmentIndex == 1{
            self.rotationAnimation.reverse = false
            return self.rotationAnimation
        }else
        {
            self.mailAnimation.reverse = false
            return mailAnimation
        }
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        if self.segment.selectedSegmentIndex == 0{
            
            return self.dismissAnimation
            
        }else if self.segment.selectedSegmentIndex == 1{
            self.rotationAnimation.reverse = true
            return self.rotationAnimation
        }else
        {
            self.mailAnimation.reverse = true
            return mailAnimation
        }
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
