//
//  DateAndTimeViewController.m
//  HelloWorld
//
//  Created by mingchao on 13-7-1.
//  Copyright (c) 2013年 zhangzhiyi. All rights reserved.
//

#import "DateAndTimeViewController.h"

@interface DateAndTimeViewController ()
    
@end

@implementation DateAndTimeViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    NSDate *now = [NSDate date];
    
    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:now dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterShortStyle];
    
    self.timeLabel.text = [NSDateFormatter localizedStringFromDate:now dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle];
}
@end
