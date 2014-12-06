//
//  DetailViewController.m
//  newMyApp
//
//  Created by Yuki Watanabe on 2014/11/22.
//  Copyright (c) 2014年 Yuki Watanabe. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;

@property (strong, nonatomic) IBOutlet UITextView *contentField;
@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextField *titleField2;
@property (strong, nonatomic) IBOutlet UIButton *firstButton;
@property (strong, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextView *contentfield;
@property (strong, nonatomic) id detailItem;
@end

@implementation DetailViewController
{
    NSInteger fieldValue;
    NSMutableDictionary *detailContents;
    UIView *hideView;
    UIPickerView *picker;
    UIPickerView *picker2;
    int number;
    NSArray *aItemList;
    IBOutlet UILabel *sum;
    
    }

#pragma mark - Managing the detail item


- (void)viewDidLoad
{
    [super viewDidLoad];

    picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, picker.frame.size.width, picker.frame.size.width)];
    
    picker2 = [[UIPickerView alloc]init];initWithFrame:CGRectMake(0, 20, picker.frame.size.width, picker.frame.size.width);
    
    // デリゲートを設定
    picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
//    [self.view addSubview:picker];
    
  
    
    picker2 = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker2.delegate = self;
    
    // データソースを設定
    picker2.dataSource = self;
    
    // 選択インジケータを表示
    picker2.showsSelectionIndicator = YES;
    
    picker.tag = 1;
    
    picker2.tag = 2;
    
    _firstButton.tag = 3;
    
    _secondButton.tag = 4;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}





/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

/**
 * 行のサイズを変更
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 50.0;
            break;
            
//        case 1: // 2列目
//            return 100.0;
//            break;
            
            //        case 2: // 3列目
            //            return 150.0;
            //            break;
            
        default:
            return 0;
            break;
    }
}



- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return [NSString stringWithFormat:@"%ld", (long)row];
            break;
            
        case 1: // 2列目
            return [NSString stringWithFormat:@"%ld", (long)row];
            break;

        default:
            return 0;
            break;
    }
}


//TODO:val0とval1足せるようにする
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)rowinComponent:(NSInteger)component
{

    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:@"%dval0" forKey:@"KEY_I"];
    [ud setFloat:1.23 forKey:@"KEY_F"];

    if(picker2){
    // 1列目の選択された行数を取得
    NSInteger val1 = [pickerView selectedRowInComponent:0];
        [ud setInteger:100 forKey:@"KEY_I"];
        [ud setFloat:1.23 forKey:@"KEY_F"];

    
    NSLog(@"1列目:%d行目が選択", val1);
    
    

    }
    if(picker){
        // 1列目の選択された行数を取得
        NSInteger val0 = [pickerView selectedRowInComponent:0];
        
       
        
        NSLog(@"1列目:%d行目", (long)val0);

    }
//sum.text = [NSString stringWithFormat:@"%ld",(long)val0+val1];
}





-(IBAction)button1{
    [self selectlimit];
}
-(IBAction)button2{
    [self selectlimit2];
}

-(void)selectlimit{
    if(hideView == nil){
        hideView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 240)];
        hideView.backgroundColor = [UIColor lightGrayColor];
        [hideView addSubview:picker];
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelButton.frame = CGRectMake(20, 4, 90, 35);
        UIFont *font = [UIFont fontWithName:@"Helvetica" size:17];
        [cancelButton.titleLabel setFont:font];
        [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
        cancelButton.tintColor = [UIColor colorWithRed:0.514 green:0.573 blue:0.573 alpha:1];
        [cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        [hideView addSubview:cancelButton];
    
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        doneButton.frame = CGRectMake(260, 4, 50, 35);
        [doneButton.titleLabel setFont:font];
        [doneButton setTitle:@"kanryou" forState:UIControlStateNormal];
    
        doneButton.tintColor = [UIColor colorWithRed:0.514 green:0.573 blue:0.573 alpha:1];
        [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
        [hideView addSubview:doneButton];
    
        [self.view addSubview:hideView];
    }
        [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = hideView.frame;
        frame.origin.y = self.view.frame.size.height - frame.size.height;
        hideView.frame = frame;
        }completion:^(BOOL finished) {
        
    }];
    
}
-(void)selectlimit2{
    if(hideView == nil){
        hideView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 240)];
        hideView.backgroundColor = [UIColor lightGrayColor];
        [hideView addSubview:picker2];
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelButton.frame = CGRectMake(20, 4, 90, 35);
        UIFont *font = [UIFont fontWithName:@"Helvetica" size:17];
        [cancelButton.titleLabel setFont:font];
        [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
        cancelButton.tintColor = [UIColor colorWithRed:0.514 green:0.573 blue:0.573 alpha:1];
        [cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        [hideView addSubview:cancelButton];
        
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        doneButton.frame = CGRectMake(260, 4, 50, 35);
        [doneButton.titleLabel setFont:font];
        [doneButton setTitle:@"kanryou" forState:UIControlStateNormal];
        
        doneButton.tintColor = [UIColor colorWithRed:0.514 green:0.573 blue:0.573 alpha:1];
        [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
        [hideView addSubview:doneButton];
        
        [self.view addSubview:hideView];
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = hideView.frame;
        frame.origin.y = self.view.frame.size.height - frame.size.height;
        hideView.frame = frame;
    }completion:^(BOOL finished) {
        
    }];
    
}
-(void)done:(UIButton*)button{

    
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint scrollPoint = CGPointMake(0, 70.0);
        hideView.center = CGPointMake(160, self.view.frame.size.height+hideView.frame.size.height);
    }completion:^(BOOL finished){
    }];
}
-(void)cancel:(UIButton*)button{
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint scrollPoint = CGPointMake(0,-90.0);
        hideView.center = CGPointMake(160, self.view.frame.size.height+hideView.frame.size.height);
    }completion:^(BOOL finished){
    
    }];
}

@end
