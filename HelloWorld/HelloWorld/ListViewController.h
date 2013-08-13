//
//  ListViewController.h
//  HelloWorld
//
//  Created by mingchao on 13-7-5.
//  Copyright (c) 2013年 zhangzhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UITableViewController

@property (strong, nonatomic)NSMutableArray *listArray;
@property (copy, nonatomic)NSDictionary *editedSelection;
@end
