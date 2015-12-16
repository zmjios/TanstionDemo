//
//  CommentViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/16.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let label:UILabel = UILabel.init(frame: CGRectMake(20, 100, self.view.bounds.size.width - 40, 200))
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.Center
        label.text = "这是新闻评论，我们是有态度的新闻客户端😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂😂"
        self.view.addSubview(label)
        
        
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
