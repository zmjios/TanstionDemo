//
//  SourceViewController.swift
//  TanstionDemo
//
//  Created by 曾明剑 on 15/12/16.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController,ZoomTransitionProtocol{
    
    
    var transition:ZoomInteractiveTransition?
    var imageView:UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.title = "图片"
        
        let image:UIImage = UIImage.init(named: "11.jpg")!
        self.imageView =  UIImageView.init(image:image)
        self.imageView!.frame = CGRectMake((self.view.bounds.size.width - image.size.width/4)/2, 500, image.size.width/4, image.size.height/4);
        self.imageView!.userInteractionEnabled = true
        self.view.addSubview(self.imageView!)
        
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: "handleGesture:")
        self.imageView!.addGestureRecognizer(tapGesture)
        
        
        
        self.transition = ZoomInteractiveTransition.init(navigationController: self.navigationController)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleGesture(gesture:UITapGestureRecognizer){
        
        
        let destinationVc = DetailViewController()
        self.navigationController?.pushViewController(destinationVc, animated: true)
    }
    
    
    func viewForZoomTransition(isSource: Bool) -> UIView! {
        
        return self.imageView!
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
