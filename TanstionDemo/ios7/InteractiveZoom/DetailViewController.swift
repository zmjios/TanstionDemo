//
//  DetailViewController.swift
//  TanstionDemo
//
//  Created by 曾明剑 on 15/12/16.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,ZoomTransitionProtocol{

    var largeImageView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.title = "详情"
        
        let image:UIImage = UIImage.init(named: "11.jpg")!
        self.largeImageView =  UIImageView.init(image:image)
        self.largeImageView!.frame = CGRectMake((self.view.bounds.size.width - image.size.width)/2, (self.view.bounds.size.height - image.size.height)/2, image.size.width, image.size.height);
        self.largeImageView!.userInteractionEnabled = true
        self.view.addSubview(self.largeImageView!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    func viewForZoomTransition(isSource: Bool) -> UIView! {
        return self.largeImageView!
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
