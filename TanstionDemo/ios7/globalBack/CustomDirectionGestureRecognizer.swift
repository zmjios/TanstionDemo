//
//  CustomDirectionGestureRecognizer.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/14.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass


struct Directions: OptionSetType {
    var rawValue:Int
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
    static let Up: Directions = Directions(rawValue: 1 << 0)
    static let Down: Directions = Directions(rawValue: 1 << 1)
    static let Left: Directions = Directions(rawValue: 1 << 2)
    static let Right: Directions = Directions(rawValue: 1 << 3)
}

class CustomDirectionGestureRecognizer: UIPanGestureRecognizer {
    
    var direction:[Directions]?
    var dragDiretion:Directions?
    private var dragging:Bool = false
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent){
        
        super.touchesMoved(touches,withEvent:event)
        
        let velocity:CGPoint = self.velocityInView(self.view)
        
        if self.state == UIGestureRecognizerState.Failed{
            return
        }
        
        //检测是否是首次识别
        if(!self.dragging && !CGPointEqualToPoint(velocity, CGPointZero))
        {
            let velocities:[Int:Float] = [Directions.Up.rawValue:Float(-velocity.y),
                                        Directions.Down.rawValue:Float(velocity.y),
                                        Directions.Right.rawValue:Float(velocity.x),
                                        Directions.Left.rawValue:Float(-velocity.x)]
            
            //根据Values值排序key值
            //排序后获得方向
            let sortedKeys = (velocities as NSDictionary).keysSortedByValueUsingSelector("compare:")
            
            self.dragDiretion = Directions.init(rawValue: (sortedKeys.last as! Int))
           
            //Fails the gesture if the highest velocity isn't in the same direction as `direction` property.
            if (self.direction != nil && !self.direction!.contains(self.dragDiretion!)) {
                self.state = UIGestureRecognizerState.Failed
            }
            
           
            self.dragging = true
        }
        
    }
    
    
    override func reset() {
        
        super.reset()
        
        self.dragging = false
    }
    

    

}




