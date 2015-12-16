//
//  NewsViewController.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/16.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    
    var commentVc:CommentViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        //加载一片新闻吧
        let label:UILabel = UILabel.init(frame: CGRectMake(100, 100, self.view.bounds.size.width - 200, 100))
        label.text = "这是一篇新闻"
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
        
        self.commentVc = CommentViewController()
        
        self.pushController = self.commentVc
        
        print("========NewsViewController viewDidLoad==========")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("=======viewWillAppear======")
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
