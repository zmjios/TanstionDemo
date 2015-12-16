//
//  ContainerViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/11.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var leftCtr:LeftViewController?{
        
        willSet{
            print("begin set left controller")
        }
        
        didSet{
            
        }
    }
    
    var rightCtr:RightViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let segment:UISegmentedControl = UISegmentedControl.init(items: ["left","right"])
        segment.frame = CGRectMake(0, 0, 200, 36)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: "segmentAction:", forControlEvents: UIControlEvents.ValueChanged)
        self.navigationItem.titleView = segment
        
        self.addLeftViewController(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func segmentAction(seg:UISegmentedControl){
        
        if(seg.selectedSegmentIndex == 0){
            
            self.addLeftViewController(true)
            
        }else
        {
            self.addRightViewController(true)
        }
    }

    
    func addLeftViewController(animate:Bool){
        
        if leftCtr == nil{
            leftCtr = LeftViewController.init()
        }
        
        if(self.view.subviews.contains((leftCtr?.view)!)){
            return;
        }
        
        leftCtr?.view.frame = self.view.bounds
        self.addChildViewController(leftCtr!)
        if(rightCtr != nil){
            rightCtr?.willMoveToParentViewController(nil)
        }
       
        if animate && rightCtr != nil{
            
            let toVc:UIViewController = leftCtr!
            let fromVc:UIViewController = rightCtr!
            
            weak var weakSelf:ContainerViewController?
            weakSelf = self;
            
            self.transitionFromViewController(fromVc, toViewController: toVc, duration: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                ()->Void in
                
                    fromVc.view.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)
                
                
                }, completion: {
                    
                Bool->() in
                    
                    fromVc.removeFromParentViewController()
                    toVc.didMoveToParentViewController(weakSelf)
                   
            })
        }else
        {
            self.view.addSubview((self.leftCtr?.view)!)
        }
    }

    
    func addRightViewController(animate:Bool){
        
        if(rightCtr == nil){
            rightCtr = RightViewController.init()
        }
        
        if(self.view.subviews.contains((rightCtr?.view)!))
        {
            return;
        }
        
        let toVc:UIViewController = rightCtr!
        let fromVc:UIViewController? = leftCtr
        toVc.view.frame = self.view.bounds;
        self.addChildViewController(toVc)
        leftCtr?.willMoveToParentViewController(nil)
        
        if animate && fromVc != nil{
            
            weak var weakSelf:ContainerViewController?
            weakSelf = self;
            
            self.transitionFromViewController(fromVc!, toViewController: toVc, duration: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                ()->Void in
                
                    fromVc!.view.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)
                
                }, completion: {
                    
                    Bool->() in
                    
                    fromVc!.removeFromParentViewController()
                    toVc.didMoveToParentViewController(weakSelf)
                    
            })
        }
    }

}
