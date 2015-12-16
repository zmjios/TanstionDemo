//
//  UIViewExtension.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/15.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import Foundation
import UIKit


extension UIView{
    
    
    func  addLeftSideShadowWithFading(){
        
        let shadowWidth:CGFloat = 4.0;
        let shadowVerticalPadding:CGFloat = -20.0; // negative padding, so the shadow isn't rounded near the top and the bottom
        let shadowHeight:CGFloat = (CGRectGetHeight(self.frame)) - 2 * shadowVerticalPadding
        let shadowRect:CGRect = CGRectMake(-shadowWidth, shadowVerticalPadding, shadowWidth, shadowHeight)
        let shadowPath:UIBezierPath = UIBezierPath.init(rect: shadowRect)
        self.layer.shadowPath = shadowPath.CGPath
        self.layer.shadowOpacity = 0.2
        
        // fade shadow during transition
        let toValue:Float = 0.0;
        let animation:CABasicAnimation = CABasicAnimation.init(keyPath:"shadowOpacity")
        animation.fromValue = Float(self.layer.shadowOpacity)
        animation.toValue = toValue
        self.layer.addAnimation(animation, forKey: nil)
        self.layer.shadowOpacity = toValue

    }
}
