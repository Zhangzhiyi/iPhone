//
//  Person.m
//  TestNSNotificationCenter
//
//  Created by mingchao on 14-3-6.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"ET";
    }
    return self;
}
- (void)printName
{
    NSLog(@"Person:name = %@!!", self.name);
}
+ (void)someThing
{
    NSLog(@"This is static method!!!");
}
@end
