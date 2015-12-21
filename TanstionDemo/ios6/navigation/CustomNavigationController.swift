//
//  CustomNavigationController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/17.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        
        if animated{
            
            let transition = CATransition()
            transition.duration = 0.6
            transition.type = kCATransitionFade
            transition.subtype = kCATransitionFromRight
            
            self.view.layer.addAnimation(transition, forKey: kCATransition)
        }
        
        super.pushViewController(viewController, animated: false)
        
    }
    
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        
        if animated
        {
            let transition = CATransition()
            transition.duration = 0.6
            transition.type = "cube"
            transition.subtype = kCATransitionFromLeft
            
            self.view.layer.addAnimation(transition, forKey: kCATransition)
        }
        
        return super.popViewControllerAnimated(false)
    }

}
