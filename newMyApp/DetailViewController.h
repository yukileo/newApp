//
//  DetailViewController.h
//  newMyApp
//
//  Created by Yuki Watanabe on 2014/11/22.
//  Copyright (c) 2014年 Yuki Watanabe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>{
    int TheNum;
    int ChosenNum;
    
    // NSString *pic1_str;
    
    IBOutlet UIButton *b1;
    IBOutlet UIButton *b2;
    IBOutlet UIButton *b3;
    IBOutlet UIButton *b4;

    
    
}
@property (nonatomic) int TableSum;
@property (nonatomic) int TableSum2;

-(void)showPicker;
@property (strong,nonatomic)NSNumber *contentsNumber;
@end
