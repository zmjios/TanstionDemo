//
//  SwiftUtil.swift
//  TanstionDemo
//
//  Created by zmjios on 15/12/11.
//  Copyright © 2015年 zmjios. All rights reserved.
//

import Foundation

extension NSObject {
    // create a static method to get a swift class for a string name
    class func SwiftClassFromString(className: String) -> AnyClass! {
        // get the project name
        if  let appName: String? = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
            // generate the full name of your class (take a look into your "YourProject-swift.h" file)
            let classStringName = "_TtC\(appName!.characters.count)\(appName)\(className.characters.count)\(className)"
            // return the class!
            return NSClassFromString(classStringName)
        }
        return nil;
    }
}

