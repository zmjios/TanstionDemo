//
//  SecondViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/12.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.title = "secondVc"
        
        
        let imageView:UIImageView =  UIImageView.init(image: UIImage.init(named: "12.jpg"))
        imageView.frame = CGRectMake(30, 30, self.view.bounds.size.width - 60, self.view.bounds.height - 60);
        imageView.userInteractionEnabled = true
        self.view.addSubview(imageView)
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

}
