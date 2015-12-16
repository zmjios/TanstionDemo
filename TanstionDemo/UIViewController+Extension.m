//
//  UIViewController+Extension.m
//  TanstionDemo
//
//  Created by zmjios on 15/12/15.
//  Copyright © 2015年 zmjios. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>


static char pushControllerKey;

@implementation UIViewController (Extension)


- (void)setPushController:(UIViewController *)pushController
{
    objc_setAssociatedObject(self, &pushControllerKey, pushController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIViewController *)pushController
{
    return objc_getAssociatedObject(self, &pushControllerKey);
}

@end
