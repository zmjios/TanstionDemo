//
//  CustomNaviViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/12.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CustomNaviViewController: UIViewController,UINavigationControllerDelegate{

    
    
    var interactiveAnimation:CustomInteractiveAniamtion!
    var cubeAnimation:CubeAnimation!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let button:UIButton = UIButton.init(type: UIButtonType.RoundedRect)
        button.setTitle("push", forState: UIControlState.Normal)
        button.frame = CGRectMake(100, 100, 100, 100)
        button.addTarget(self, action: "pushTest", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        
        self.navigationController?.delegate = self
        self.cubeAnimation = CubeAnimation()
        self.interactiveAnimation = CustomInteractiveAniamtion(navi: self.navigationController!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func pushTest(){
        
        let secondVc = SecondViewController()
        self.navigationController?.pushViewController(secondVc, animated: true)
        
    }
    
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        return self.interactiveAnimation.interacting ? self.interactiveAnimation:nil
    }
    
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        self.cubeAnimation.reverse = operation == .Pop
        
        return self.cubeAnimation
       
    }


}
