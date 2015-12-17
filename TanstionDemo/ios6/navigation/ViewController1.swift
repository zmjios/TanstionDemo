//
//  ViewController1.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/17.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = UIColor.yellowColor()
        self.title = "ViewController1"
        
        
        let button:UIButton  = UIButton(type: UIButtonType.Custom)
        button.frame = CGRectMake(100, 100, 60, 60)
        button.tintColor = UIColor.blackColor()
        button.backgroundColor = UIColor.blackColor()
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        button.addTarget(self, action: "pushAction", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(button)
        
        
        let leftItem = UIBarButtonItem(title: "取消", style:UIBarButtonItemStyle.Plain, target: self, action: "cancelAction")
        self.navigationItem.leftBarButtonItem = leftItem

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelAction(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func pushAction(){
        
        
        let vc = ViewController2()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
