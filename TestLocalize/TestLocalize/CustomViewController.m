//
//  CustomViewController.m
//  TestLocalize
//
//  Created by mingchao on 14-1-5.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UILabel *label;
@end

@implementation CustomViewController

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
	// Do any additional setup after loading the view.
    //NSlocalizeString第一个参数是key，第二个参数是在系统生成Localize.strings文件时，生成的注释，不需要的话可以设置为nil
    self.label.text = NSLocalizedString(@"label", nil);
    NSString *btnName =NSLocalizedString(@"btnName", nil);
    [self.button setTitle:btnName forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
