//
//  DetailViewController.h
//  newMyApp
//
//  Created by Yuki Watanabe on 2014/11/22.
//  Copyright (c) 2014年 Yuki Watanabe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>{
    int number;
    
    //    UIAlertView *alert;
    
    NSArray*       aItemList;
    IBOutlet UILabel *sum;
    
}

-(IBAction)button1;
-(IBAction)button2;
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextField *textField3;


-(void)showPicker;

@property (strong,nonatomic)NSNumber *contentsNumber;


@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextView *contentfield;

@property (strong, nonatomic) id detailItem;
@end
