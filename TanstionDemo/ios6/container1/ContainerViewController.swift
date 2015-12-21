//
//  ContainerViewController.swift
//  TanstionDemo
//
//  Created by 曾明剑 on 15/12/20.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var duringAnimation:Bool = false{
        
        didSet{
            
            if duringAnimation{
                self.segment?.userInteractionEnabled = false
            }else
            {
                self.segment?.userInteractionEnabled = true
            }
        }
    }
    
    var segment:UISegmentedControl?
    
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
        
        self.segment = UISegmentedControl.init(items: ["left","right"])
        self.segment!.frame = CGRectMake(0, 0, 200, 36)
        self.segment!.selectedSegmentIndex = 0
        self.segment!.addTarget(self, action: "segmentAction:", forControlEvents: UIControlEvents.ValueChanged)
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
            
            //该方法会主动将toViewController的View添加到当前容器控制器中，所以不需要调用addSubView方法，并且addSubView在动画执行之前，当动画执行完后，系统会主动将fromVc的View从当前容器中移除
            self.transitionFromViewController(fromVc, toViewController: toVc, duration: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                ()->Void in
                
                self.duringAnimation = true
                let transform = CGAffineTransformMakeTranslation(CGRectGetWidth(fromVc.view.bounds), 0)
                fromVc.view.transform = transform
    
    
                }, completion: {
                    
                    Bool->() in
                    
                    self.duringAnimation =  false
                    fromVc.view.transform = CGAffineTransformIdentity
                    fromVc.removeFromParentViewController()
                    toVc.didMoveToParentViewController(weakSelf)
                    
            })
            self.view.sendSubviewToBack(toVc.view)
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
            
            //该方法会主动将toViewController的View添加到当前容器控制器中，所以不需要调用addSubView方法，并且addSubView在动画执行之前，当动画执行完后，系统会主动将fromVc的View从当前容器中移除
            self.transitionFromViewController(fromVc!, toViewController: toVc, duration: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                ()->Void in
                
                self.duringAnimation = true
                fromVc!.view.transform = CGAffineTransformMakeTranslation(-CGRectGetWidth((fromVc?.view.bounds)!), 0)
                }, completion: {
                    
                    finished in
                    
                    self.duringAnimation = false
                    fromVc?.view.transform = CGAffineTransformIdentity
                    fromVc!.removeFromParentViewController()
                    toVc.didMoveToParentViewController(weakSelf)
                    
            })
            self.view.sendSubviewToBack(toVc.view)
        }
    }
    
}

