//
//  TranstionUtil.m
//  TanstionDemo
//
//  Created by zmjios on 15/12/11.
//  Copyright © 2015年 zmjios. All rights reserved.
//

#import "TranstionUtil.h"

@implementation TranstionUtil


+ (Class)swiftClassFromString:(NSString *)className
{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString *classStringName = [NSString stringWithFormat:@"_TtC%lu%@%lu%@", (unsigned long)appName.length, appName, (unsigned long)className.length, className];
    return NSClassFromString(classStringName);
}

@end
