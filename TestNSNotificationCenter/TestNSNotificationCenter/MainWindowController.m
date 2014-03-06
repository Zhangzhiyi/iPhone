//
//  MainWindowController.m
//  TestNSNotificationCenter
//
//  Created by mingchao on 14-3-6.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import "MainWindowController.h"
#import "Person.h"
@interface MainWindowController ()
@property (strong, nonatomic) Person *person;
@end

@implementation MainWindowController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.person = [[Person alloc] init];
    }
    return self;
}
- (IBAction)registerObserver:(id)sender
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callBack1:) name:@"notification1" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callBack2:) name:@"notification2" object:nil];
    //第三个参数object不为nil的时候，通知系统会根据此object对象来识别发过来的广播是否下发给之前已经注册的观察者。所以name和objcet都要一样，notification3才能收到通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callBack3:) name:@"notification3" object:@"Free"];
    
    //观察者为Person实例对象
    [[NSNotificationCenter defaultCenter] addObserver:self.person selector:@selector(printName) name:@"Person:object" object:nil];
    //观察者为Person类对象
    [[NSNotificationCenter defaultCenter] addObserver:[Person class] selector:@selector(someThing) name:@"Person:class" object:nil];
}
- (void)postNotification:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification1" object:@"This is notification1!"];
    //构造一个NSNotification再发送
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"notification1" object:nil]];
    
    NSDictionary *dict = @{@"ET":@"WQQ"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification2" object:@"This is notification2!" userInfo:dict];
    
    //notification3不会收到此广播
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification3" object:@"This is notification3!"];
    
    //Person
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Person:object" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Person:class" object:nil];
}
- (void)callBack1:(NSNotification *)notification
{
    NSString *name = [notification name];
    id object = [notification object];
    NSLog(@"name = %@, object = %@", name, object);
}
- (void)callBack2:(NSNotification *)notification
{
    NSString *name = [notification name];
    id object = [notification object];
    NSDictionary *dict = [notification userInfo];
    NSLog(@"name = %@, object = %@, useInfo = %@", name, object, [dict objectForKey:
          @"ET"]);
}
- (void)callBack3:(NSNotification *)notification
{
    NSString *name = [notification name];
    id object = [notification object];
    NSLog(@"name = %@, object = %@", name, object);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
