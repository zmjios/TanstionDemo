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
static char customBackButtonKey;
static char customPushButtonKey;

@implementation UIViewController (Extension)


- (void)setPushController:(UIViewController *)pushController
{
    objc_setAssociatedObject(self, &pushControllerKey, pushController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIViewController *)pushController
{
    return objc_getAssociatedObject(self, &pushControllerKey);
}


- (void)setCustomBackButton:(UIButton *)customBackButton
{
    objc_setAssociatedObject(self, &customBackButtonKey, customBackButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIButton *)customBackButton
{
    return objc_getAssociatedObject(self, &customBackButtonKey);
}


- (void)setCustomPushButton:(UIButton *)customPushButton
{
    objc_setAssociatedObject(self, &customPushButtonKey, customPushButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIButton *)customPushButton
{
    return objc_getAssociatedObject(self, &customPushButtonKey);
}


@end
