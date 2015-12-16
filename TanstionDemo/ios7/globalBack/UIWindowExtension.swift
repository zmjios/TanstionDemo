//
//  UIWindowExtension.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/15.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication{
    
    static func topViewController()->UIViewController?{
        
        let keyWindow:UIWindow = self.sharedApplication().keyWindow!
        var controller:UIViewController?
        
        for var subView in keyWindow.subviews{
            
            var responder = subView.nextResponder()
            
            if (responder != nil && responder!.isEqual(keyWindow)){
                
                if subView.subviews.count > 0{
                    
                    let subSubView:UIView = subView.subviews.first!
                    responder = subSubView.nextResponder()
                }
            }
            
            if (responder != nil && responder!.isKindOfClass(UIViewController.self)){
                
                controller = responder as! UIViewController!
                var isPrensenting = false
                repeat{
                    let presentVc = controller?.presentedViewController
                    isPrensenting = presentVc != nil
                    if(presentVc != nil){
                        controller = presentVc
                    }
                
                }while isPrensenting
                break;
            }
        }
        
        return controller
        
    }
}

