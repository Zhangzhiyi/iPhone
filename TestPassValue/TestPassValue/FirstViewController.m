//
//  FirstViewController.m
//  TestPassValue
//
//  Created by mingchao on 14-2-9.
//  Copyright (c) 2014年 zhangzhiyi. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "UserEntity.h"
@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UIButton *passBtn;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation FirstViewController

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
- (IBAction)passValue:(id)sender
{
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    UserEntity *userEntity = [[UserEntity alloc] init];
    userEntity.name = self.nameTextField.text;
    userEntity.age = [self.ageTextField.text intValue];
    secondViewController.userEntity = userEntity;
    [self presentViewController:secondViewController animated:YES completion:nil];
}
@end
