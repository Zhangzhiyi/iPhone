//
//  MainWindowController.h
//  TestNSNotificationCenter
//
//  Created by mingchao on 14-3-6.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainWindowController : UIViewController

- (IBAction)registerObserver:(id)sender;
- (IBAction)postNotification:(id)sender;
- (void)callBack1:(NSNotification *)notification;
- (void)callBack2:(NSNotification *)notification;
- (void)callBack3:(NSNotification *)notification;
@end
