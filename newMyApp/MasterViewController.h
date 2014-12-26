//
//  MasterViewController.h
//  newMyApp
//
//  Created by Yuki Watanabe on 2014/11/22.
//  Copyright (c) 2014年 Yuki Watanabe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController
{
    int contentsNumber;
    int i;
    IBOutlet UITableView *myTableView;
    
}

@property (nonatomic,retain) UITableView *myTableView;
@end
