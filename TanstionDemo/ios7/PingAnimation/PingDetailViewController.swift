//
//  PingDetailViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/17.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class PingDetailViewController: UIViewController {

    
    var imageView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.orangeColor()
        
        let button:UIButton  = UIButton(type: UIButtonType.Custom)
        button.frame = CGRectMake(self.view.bounds.size.width - 100, 40, 60, 60)
        button.tintColor = UIColor.blackColor()
        button.backgroundColor = UIColor.blackColor()
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        button.addTarget(self, action: "backAction", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(button)
        
        
        let image:UIImage = UIImage.init(named: "12.jpg")!
        self.imageView =  UIImageView.init(image:image)
        self.imageView!.frame = CGRectMake((self.view.bounds.size.width - image.size.width)/2, 100, image.size.width, image.size.height);
        self.imageView!.userInteractionEnabled = true
        self.view.addSubview(self.imageView!)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func backAction(){
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
