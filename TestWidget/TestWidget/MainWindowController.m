//
//  MainWindowController.m
//  TestWidget
//
//  Created by mingchao on 14-1-5.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()
@property (strong, nonatomic) IBOutlet UIButton *button;
@end

@implementation MainWindowController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.button setTitle:@"123" forState:UIControlStateNormal];
}

- (IBAction)clickBtn:(id)sender
{
    NSLog(@"click!");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
