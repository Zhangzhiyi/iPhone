//
//  AppDelegate.m
//  TestNotification
//
//  Created by mingchao on 14-1-28.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import "AppDelegate.h"
#import "BPush.h"
@interface AppDelegate()
@property (nonatomic) UIBackgroundTaskIdentifier background_task;
@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"willFinishLaunchingWithOptions");
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions");
    if (launchOptions) {
        //本地通知相关：
        UILocalNotification *localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
        if (localNotif) {
            NSString *value = [localNotif.userInfo objectForKey:@"key"];
            if (value) {
                NSLog(@"local notification:%@", value);
            }
        }
        //远程通知相关：当不在前台或者后台运行的时候，点击远程通知启动app，以下代码可以获取远程通知的消息
        //这里注意远程通知是没有UIRemoteNotification类的，取出来是字典NSDictionary
        NSDictionary *remoteNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (remoteNotif) {
            NSString *alert = [[remoteNotif objectForKey:@"aps"] objectForKey:@"alert"];
            NSString *name = [remoteNotif objectForKey:@"name"];
            NSLog(@"alert: %@,  name:%@", alert, name);
        }
    }
    [BPush setupChannel:launchOptions];
    [BPush setDelegate:self];
    
    [application setApplicationIconBadgeNumber:0];
    //注册通知。如果你的应用之前已经注册了，那么调用registerForRemoteNotificationTypes的时候didRegisterForRemoteNotificationsWithDeviceToken会立即返回设备的令牌，不会造成额外的负载
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert| UIRemoteNotificationTypeBadge| UIRemoteNotificationTypeSound];
    
    return YES;
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken:%@", deviceToken);
    [BPush registerDeviceToken:deviceToken];
    [BPush bindChannel];
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //当前在前台运行的时候，如果接收到推送通知会直接调用此方法;如果不在前台运行而在后台，接收到推送通知要点击推送通知启动前台应用会运行此方法;如果当前不在前台运行也不在后台运行，点击通知消息启动app,在didFinishLaunchingWithOptions可以获取到远程通知的消息体
     
     
     /*可以根据在iOS上，你可以通过确定应用程序的状态来确定是否是应用程序由于用户点击了动作按钮而启动，或通知被提交给已经运行的应用。通过委托实现application:didReceiveRemoteNotification:或 application:didReceiveLocalNotification:方法，获取应用程序的 applicationState 属性值并判定它。如果值为 UIApplicationStateInactive,表明用户单击了动作按钮。如果值为 UIApplicationStateActive,表明应用收到此通知的时候已经运行在前台。**/
    NSLog(@"didReceiveRemoteNotification: %@", [userInfo debugDescription]);
    NSLog(@"name:%@", [userInfo objectForKey:@"name"]);
    NSString *alert = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    if (application.applicationState == UIApplicationStateActive) {
        // Nothing to do if applicationState is Inactive, the iOS already displayed an alert view.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Did receive a Remote Notification"
                                                            message:[NSString stringWithFormat:@"The application received this remote notification while it was running:\n%@", alert]
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    [application setApplicationIconBadgeNumber:0];
    
    [BPush handleNotification:userInfo];
    
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"didReceiveLocalNotification");
    NSString *alert = notification.alertBody;
    NSString *value = [notification.userInfo objectForKey:@"key"];
    NSLog(@"alert:%@, value:%@", alert, value);
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError: %@", error);
}
- (void) onMethod:(NSString*)method response:(NSDictionary*)data {
    NSLog(@"On method:%@", method);
    NSLog(@"data:%@", [data description]);
    NSDictionary* res = [[NSDictionary alloc] initWithDictionary:data];
    if ([BPushRequestMethod_Bind isEqualToString:method]) {
        NSString *appid = [res valueForKey:BPushRequestAppIdKey];
        NSString *userid = [res valueForKey:BPushRequestUserIdKey];
        NSString *channelid = [res valueForKey:BPushRequestChannelIdKey];
        NSString *requestid = [res valueForKey:BPushRequestRequestIdKey];
        int returnCode = [[res valueForKey:BPushRequestErrorCodeKey] intValue];
        
        if (returnCode == BPushErrorCode_Success) {
            
        }
    } else if ([BPushRequestMethod_Unbind isEqualToString:method]) {
        int returnCode = [[res valueForKey:BPushRequestErrorCodeKey] intValue];
        if (returnCode == BPushErrorCode_Success) {

        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive");
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
    if ([[UIDevice currentDevice] isMultitaskingSupported]) { //Check if device supports mulitasking
        UIApplication *application = [UIApplication sharedApplication]; //Get the shared application instance
        
        self.background_task = [application beginBackgroundTaskWithExpirationHandler: ^ {
            /*
             当应用程序后台停留的时间差不多要结束时，会执行下面的操作（应用程序后台停留的时间可以通过backgroundTimeRemaining查看）
             */
            [application endBackgroundTask: self.background_task]; //Tell the system that we are done with the tasks
            self.background_task = UIBackgroundTaskInvalid; //Set the task to be invalid
            
            //System will be shutting down the app at any point in time now
        }];
        
        // Background tasks require you to use asyncrous tasks
        
        //Perform your tasks that your application requires
        NSLog(@"time remain:%f", application.backgroundTimeRemaining);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            for (int i=0; i < 20; i++) {
//                NSLog(@"%d", i);
//                sleep(1);
//            }
            //application.backgroundTimeRemaining > 1.0f
            while (application.backgroundTimeRemaining) {
                //NSLog(@"time remain:%f", application.backgroundTimeRemaining);
                sleep(1);
            }
            if (self.background_task != UIBackgroundTaskInvalid) {
                [[UIApplication sharedApplication] endBackgroundTask:self.background_task];
                self.background_task = UIBackgroundTaskInvalid;
            }
        });
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
    if (self.background_task != UIBackgroundTaskInvalid)
    {
        [[UIApplication sharedApplication] endBackgroundTask:self.background_task];
        self.background_task = UIBackgroundTaskInvalid;
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");
}
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"applicationDidReceiveMemoryWarning");
}
@end
