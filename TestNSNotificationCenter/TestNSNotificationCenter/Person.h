//
//  Person.h
//  TestNSNotificationCenter
//
//  Created by mingchao on 14-3-6.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (strong, nonatomic) NSString *name;

- (void)printName;
+ (void)someThing;
@end
