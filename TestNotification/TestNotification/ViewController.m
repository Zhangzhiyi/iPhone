//
//  ViewController.m
//  TestNotification
//
//  Created by mingchao on 14-1-28.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button1;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton1:(id)sender
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification) {
        NSDate *now = [NSDate date];
        notification.fireDate = [now dateByAddingTimeInterval:6];
        notification.repeatInterval = 0;
        notification.timeZone = [NSTimeZone defaultTimeZone];
        notification.soundName = UILocalNotificationDefaultSoundName;
        notification.alertBody = @"该去吃饭了！";
        notification.alertAction = @"打开";
        
        notification.hasAction = YES;
        notification.applicationIconBadgeNumber = 1;
        
        NSDictionary *dict = @{@"key":@"value"};
        notification.userInfo = dict;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
    }
}
@end
