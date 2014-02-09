//
//  SecondViewController.m
//  TestPassValue
//
//  Created by mingchao on 14-2-9.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import "SecondViewController.h"
#import "UserEntity.h"
@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    debugMethod();
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    debugMethod();
    [self.backBtn setTitle:@"12313" forState:UIControlStateNormal];
    self.nameLabel.text = self.userEntity.name;
    self.ageLabel.text = [NSString stringWithFormat:@"%d", self.userEntity.age];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    debugMethod();
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    debugMethod();
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    debugMethod();
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    debugMethod();
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    debugMethod();
}

- (IBAction)clickBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
