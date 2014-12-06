//
//  DetailViewController.h
//  newMyApp
//
//  Created by Yuki Watanabe on 2014/11/22.
//  Copyright (c) 2014年 Yuki Watanabe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>{
    
}

-(void)showPicker;
@property (strong,nonatomic)NSNumber *contentsNumber;
@end
