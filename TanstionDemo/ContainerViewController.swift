//
//  ContainerViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/11.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var segment:UISegmentedControl?
    
    var leftCtr:LeftViewController?{
        
        willSet{
            print("begin set left controller")
        }
        
        didSet{
            
            
        }
    }
    
    var rightCtr:RightViewController?
    
    var duringAnimation:Bool = false{
        
        didSet{
            
             print("duringAnimation从 \(oldValue) 设定至 \(duringAnimation)")
            
            if duringAnimation{
                self.segment!.userInteractionEnabled = false
            }else
            {
                self.segment!.userInteractionEnabled = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.segment = UISegmentedControl(items: ["left","right"])
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
            leftCtr = LeftViewController()
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
            
            //该方法系统会自动将toVc.view 添加到容器控制器的view中，不需要手动调用addsubView方法,然后才开始动画！！！！所以fromVc已经在后面了，所以动画看不到😂,所以执行后立即将toVc.view放到后面去
            self.transitionFromViewController(fromVc, toViewController: toVc, duration: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                    self.duringAnimation = true
                    fromVc.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(fromVc.view.frame), 0)
                
                }, completion: {
                    
                finished in
                    
                    self.duringAnimation = false
                    fromVc.view.transform = CGAffineTransformIdentity
                    fromVc.removeFromParentViewController()
                    self.view.bringSubviewToFront(toVc.view)
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
        toVc.view.alpha = 0
        self.addChildViewController(toVc)
        leftCtr?.willMoveToParentViewController(nil)
        
        if animate && fromVc != nil{
            
            weak var weakSelf:ContainerViewController?
            weakSelf = self;
            
            self.transitionFromViewController(fromVc!, toViewController: toVc, duration: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                    self.duringAnimation = true
                    toVc.view.alpha = 1
                    fromVc!.view.transform = CGAffineTransformMakeTranslation(-CGRectGetWidth(fromVc!.view.frame),0)
                
                }, completion: {
                    
                    finished in
                    
                    self.duringAnimation = false
                    fromVc!.view.transform = CGAffineTransformIdentity
                    fromVc!.removeFromParentViewController()
                    self.view.bringSubviewToFront(toVc.view)
                    toVc.didMoveToParentViewController(weakSelf)
                    
            })
            self.view.sendSubviewToBack(toVc.view)
        }
    }

}
