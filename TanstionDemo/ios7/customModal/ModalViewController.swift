//
//  ModalViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/12.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit


public protocol ModalViewControllerDelegate:NSObjectProtocol{
    
    func modalViewControllerDismissed(modalVc:UIViewController)
    
}


class ModalViewController: UIViewController {
    
    
    weak var delegate:ModalViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.title = "Modal View"
        
        let button:UIButton = UIButton.init(type: UIButtonType.RoundedRect)
        button.setTitle("dismiss modal vc", forState:UIControlState.Normal)
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        button.frame = CGRectMake(100, 100, UIScreen.mainScreen().bounds.size.width - 200, 44);
        self.view.addSubview(button)
        
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

    
    
    func buttonClicked(button:UIButton){
    
        if self.delegate != nil && self.delegate!.respondsToSelector("modalViewControllerDismissed:"){
            
            self.delegate!.modalViewControllerDismissed(self)
        }
    }
}



