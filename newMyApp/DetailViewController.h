//
//  DetailViewController.h
//  newMyApp
//
//  Created by Yuki Watanabe on 2014/11/22.
//  Copyright (c) 2014年 Yuki Watanabe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
