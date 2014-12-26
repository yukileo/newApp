//
//  DetailViewController.m
//  newMyApp
//
//  Created by Yuki Watanabe on 2014/11/22.
//  Copyright (c) 2014年 Yuki Watanabe. All rights reserved.
//

#import "DetailViewController.h"
#import "QBFlatButton.h"
@interface DetailViewController ()
- (void)configureView;
@property (strong, nonatomic) IBOutlet QBFlatButton *button1;
@property (strong, nonatomic) IBOutlet QBFlatButton *button2;
@property (strong, nonatomic) IBOutlet QBFlatButton *button3;
@property (strong, nonatomic) IBOutlet QBFlatButton *button4;
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
    IBOutlet UILabel *sum2;
    
    }

#pragma mark - Managing the detail item


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _button1 = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    _button1.frame = CGRectMake(220, 130 - 20 - 40, 80, 60);
    _button1.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    _button1.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _button1.radius = 8.0;
    _button1.margin = 4.0;
    _button1.depth = 3.0;
   
    
    _button1.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button1 setTitle:@"装備1" forState:UIControlStateNormal];
    
    [_button1 addTarget:self action:@selector(button1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button1];
    
    _button2 = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    _button2.frame = CGRectMake(220, 210 - 20 - 40, 80, 60);
    _button2.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    _button2.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _button2.radius = 8.0;
    _button2.margin = 4.0;
    _button2.depth = 3.0;
    
    
    _button2.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button2 setTitle:@"装備2" forState:UIControlStateNormal];
    
    [_button2 addTarget:self action:@selector(button2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button2];
    
    _button3 = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    _button3.frame = CGRectMake(220, 290 - 20 - 40, 80, 60);
    _button3.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    _button3.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _button3.radius = 8.0;
    _button3.margin = 4.0;
    _button3.depth = 3.0;
    
    
    _button3.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button3 setTitle:@"装備3" forState:UIControlStateNormal];
    
    [_button3 addTarget:self action:@selector(button3) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button3];

    
    _button4 = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    _button4.frame = CGRectMake(220, 370 - 20 - 40, 80, 60);
    _button4.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    _button4.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _button4.radius = 8.0;
    _button4.margin = 4.0;
    _button4.depth = 3.0;
    
    
    _button4.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button4 setTitle:@"装備4" forState:UIControlStateNormal];
    
    [_button4 addTarget:self action:@selector(button4) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button4];


    picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, picker.frame.size.width, picker.frame.size.width)];
    picker.tag=1;
    
//    picker2 = [[UIPickerView alloc]init];initWithFrame:CGRectMake(0, 20, picker.frame.size.width, picker.frame.size.width);
//    picker2.tag=2;
//    // デリゲートを設定
    picker.delegate = self;
    
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
//    [self.view addSubview:picker];
    
  
    
//    picker2 = [[UIPickerView alloc]init];
//    
//    // デリゲートを設定
//    picker2.delegate = self;
//    
//    // データソースを設定
//    picker2.dataSource = self;
//    
//    // 選択インジケータを表示
//    picker2.showsSelectionIndicator = YES;
//    

    
    _firstButton.tag = 3;
    
    _secondButton.tag = 4;
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //TODO:出てきた時に装備の名前も保持
     NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    int i = [ud integerForKey:@"fire"];
    sum.text = [NSString stringWithFormat:@"%d",i];
    int n = [ud integerForKey:@"taiku"];
    sum2.text = [NSString stringWithFormat:@"%d",n];
    NSString *s = [ud stringForKey:@"Num1"];
    [_button1 setTitle: s forState:UIControlStateNormal];
    NSString *t = [ud stringForKey:@"Num2"];
    [_button2 setTitle: t forState:UIControlStateNormal];
    NSString *u = [ud stringForKey:@"Num3"];
    [_button3 setTitle: u forState:UIControlStateNormal];
    NSString *v = [ud stringForKey:@"Num4"];
    [_button4 setTitle: v forState:UIControlStateNormal];
}
-(IBAction)clear {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
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
    return 1;
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
    NSArray *arr = [[NSArray alloc]initWithObjects:@"なし",@"41cm砲",@"46cm砲",@"35.6cm砲",@"15.5cm砲", nil];
    pic1_str = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
    return pic1_str;
    
}



- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    

    if(TheNum == 1){
    // 1列目の選択された行数を取得
    NSInteger val0 = [pickerView selectedRowInComponent:0];
        NSInteger val4 = [pickerView selectedRowInComponent:0];
        if(row == 0){
            val0 = 0;
            val4 = 0;
            [ud setObject:@"なし" forKey:@"Num1"];
            [_button1 setTitle:@"なし" forState:UIControlStateNormal];
        }
        if(row == 1){
            val0 = 20;
            val4 = 4;
            [ud setObject:@"41cm砲" forKey:@"Num1"];
            [_button1 setTitle:@"41cm砲" forState:UIControlStateNormal];
        }
        if(row == 2){
            val0 = 26;
            val4 = 5;
            [ud setObject:@"46cm砲" forKey:@"Num1"];
            [_button1 setTitle:@"46cm砲" forState:UIControlStateNormal];
        }
        if(row == 3){
            val0 = 15;
            val4 = 4;
            [ud setObject:@"35.6cm砲" forKey:@"Num1"];
            [_button1 setTitle:@"35.6cm砲" forState:UIControlStateNormal];
        }
        if(row == 4){
            val0 = 7;
            val4 = 4;
            [ud setObject:@"15.5cm砲" forKey:@"Num1"];
            [_button1 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        [ud setInteger:val0 forKey:@"b1"];
        [ud setInteger:val4 forKey:@"b1-2"];
        
     [ud synchronize];
    
    NSLog(@"1列目:%d行目が選択", val0);
    
//sum.text = [NSString
//                stringWithFormat:@"%ld",(long)val1];
 
    }
    if(TheNum == 2){
        // 1列目の選択された行数を取得
        
       
        NSInteger val1 = [pickerView selectedRowInComponent:0];
        NSInteger val5 = [pickerView selectedRowInComponent:0];
        if(row == 0){
            val1 = 0;
            val5 = 0;
            [ud setObject:@"なし" forKey:@"Num2"];
            [_button2 setTitle:@"なし" forState:UIControlStateNormal];
        }
        if(row == 1){
            val1 = 20;
            val5 = 4;
            [ud setObject:@"41cm砲" forKey:@"Num2"];
            [_button2 setTitle:@"41cm砲" forState:UIControlStateNormal];
        }
        if(row == 2){
            val1 = 26;
            val5 = 5;
            [ud setObject:@"46cm砲" forKey:@"Num2"];
            [_button2 setTitle:@"46cm砲" forState:UIControlStateNormal];
        }
        if(row == 3){
            val1 = 15;
            val5 = 4;
            [ud setObject:@"35.6cm砲" forKey:@"Num2"];
            [_button2 setTitle:@"35.6cm砲" forState:UIControlStateNormal];
        }
        if(row == 4){
            val1 = 7;
            val5 = 4;
            [ud setObject:@"15.5cm砲" forKey:@"Num2"];
            [_button2 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        [ud setInteger:val1 forKey:@"b2"];
        [ud setInteger:val5 forKey:@"b2-2"];
        
        [ud synchronize];
        
        NSLog(@"1列目:%d行目", val1);
        
        


    }
    if(TheNum == 3){
        // 1列目の選択された行数を取得
        
        
        NSInteger val2 = [pickerView selectedRowInComponent:0];
        NSInteger val6 = [pickerView selectedRowInComponent:0];
        if(row == 0){
            val2 = 0;
            val6 = 0;
            [ud setObject:@"なし" forKey:@"Num3"];
            [_button3 setTitle:@"なし" forState:UIControlStateNormal];
        }
        if(row == 1){
            val2 = 20;
            val6 = 4;
            [ud setObject:@"41cm砲" forKey:@"Num3"];
            [_button3 setTitle:@"41cm砲" forState:UIControlStateNormal];
        }
        if(row == 2){
            val2 = 26;
            val6 = 5;
            [ud setObject:@"46cm砲" forKey:@"Num3"];
            [_button3 setTitle:@"46cm砲" forState:UIControlStateNormal];
        }
        if(row == 3){
            val2 = 15;
            val6 = 4;
            [ud setObject:@"15.5cm砲" forKey:@"Num3"];
            [_button3 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        if(row == 4){
            val2 = 7;
            val6 = 4;
            [ud setObject:@"15.5cm砲" forKey:@"Num3"];
            [_button3 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        [ud setInteger:val2 forKey:@"b3"];
        [ud setInteger:val6 forKey:@"b3-2"];
        
        [ud synchronize];
        
        NSLog(@"1列目:%d行目", val2);
        
        
    }
    if(TheNum == 4){
        // 1列目の選択された行数を取得
        
        
        NSInteger val3 = [pickerView selectedRowInComponent:0];
        NSInteger val7 = [pickerView selectedRowInComponent:0];
        if(row == 0){
            val3 = 0;
            val7 = 0;
            [ud setObject:@"なし" forKey:@"Num4"];
            [_button4 setTitle:@"なし" forState:UIControlStateNormal];
        }
        if(row == 1){
            val3 = 20;
            val7 = 4;
            [ud setObject:@"41cm砲" forKey:@"Num4"];
            [_button4 setTitle:@"41cm砲" forState:UIControlStateNormal];
        }
        if(row == 2){
            val3 = 26;
            val7 = 5;
            [ud setObject:@"46cm砲" forKey:@"Num4"];
            [_button4 setTitle:@"46cm砲" forState:UIControlStateNormal];
        }
        if(row == 3){
            val3 = 15;
            val7 = 4;
            [ud setObject:@"35.6cm砲" forKey:@"Num4"];
            [_button4 setTitle:@"35.6cm砲" forState:UIControlStateNormal];
        }
        if(row == 4){
            val3 = 7;
            val7 = 4;
            [ud setObject:@"15.5cm砲" forKey:@"Num4"];
            [_button4 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        [ud setInteger:val3 forKey:@"b4"];
        [ud setInteger:val7 forKey:@"b4-2"];
        
        [ud synchronize];
        
        NSLog(@"1列目:%d行目", val3);
        
        
    }

    int a = [ud integerForKey:@"b1"];  // KEY_Iの内容をint型として取得
   
    NSLog(@"a%d",a);
    
    int b = [ud integerForKey:@"b2"];  // KEY_Iの内容をint型として取得
    
     NSLog(@"b%d",b);
    int c = [ud integerForKey:@"b3"];  // KEY_Iの内容をint型として取得
    
    NSLog(@"a%d",a);
    
    int d = [ud integerForKey:@"b4"];  // KEY_Iの内容をint型として取得
    
    int e = [ud integerForKey:@"b1-2"];
    NSLog(@"b%d",b);
    int f = [ud integerForKey:@"b2-2"];
    NSLog(@"b%d",b);
    int g = [ud integerForKey:@"b3-2"];
    NSLog(@"b%d",b);
    int h = [ud integerForKey:@"b4-2"];
    NSLog(@"b%d",b);
    
   [ud synchronize];
    
    
    
    
    sum.text = [NSString stringWithFormat:@"%d",a + b + c + d];
    sum2.text = [NSString stringWithFormat:@"%d",e + f + g + h];
    
    
    int i = sum.text.intValue;
    [ud setInteger:i forKey: @"fire"];
    int n = sum2.text.intValue;
    [ud setInteger:n forKey:@"taiku"];
    [ud synchronize];
}





-(IBAction)button1{
    [self selectlimit];
    TheNum = 1;
    
}
-(IBAction)button2{
    [self selectlimit];
    TheNum = 2;
}
-(IBAction)button3{
  [self selectlimit];
    TheNum = 3;
}
-(IBAction)button4{
    [self selectlimit];
    TheNum = 4;
}

-(void)selectlimit{
    if(hideView == nil){
        hideView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 240)];
        hideView.backgroundColor = [UIColor lightGrayColor];
        [hideView addSubview:picker];
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelButton.frame = CGRectMake(20, 4, 70, 35);
        UIFont *font = [UIFont fontWithName:@"Helvetica" size:17];
        [cancelButton.titleLabel setFont:font];
        [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
        cancelButton.tintColor = [UIColor colorWithRed:86.0 green:161 blue:0217 alpha:1];
        [cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        [hideView addSubview:cancelButton];
    
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        doneButton.frame = CGRectMake(260, 4, 50, 35);
        [doneButton.titleLabel setFont:font];
        [doneButton setTitle:@"完了" forState:UIControlStateNormal];
    
        doneButton.tintColor = [UIColor colorWithRed:86.0 green:161 blue:0217 alpha:1];
        [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
        [hideView addSubview:doneButton];
    
        [self.view addSubview:hideView];
    }
        [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = hideView.frame;
        frame.origin.y = self.view.frame.size.height - frame.size.height;
        hideView.frame = frame;
        }completion:^(BOOL finished) {
        
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            
//            int i = sum.text.intValue;
//            [ud setInteger:i forKey: @"fire"];
//            int n = sum2.text.intValue;
//            [ud setInteger:n forKey:@"taiku"];
//            [ud synchronize];
    }];
    
}
//-(void)selectlimit2{
//    if(hideView == nil){
//        hideView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 240)];
//        hideView.backgroundColor = [UIColor lightGrayColor];
//        [hideView addSubview:picker2];
//        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        cancelButton.frame = CGRectMake(20, 4, 90, 35);
//        UIFont *font = [UIFont fontWithName:@"Helvetica" size:17];
//        [cancelButton.titleLabel setFont:font];
//        [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
//        cancelButton.tintColor = [UIColor colorWithRed:0.514 green:0.573 blue:0.573 alpha:1];
//        [cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
//        [hideView addSubview:cancelButton];
//        
//        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        doneButton.frame = CGRectMake(260, 4, 50, 35);
//        [doneButton.titleLabel setFont:font];
//        [doneButton setTitle:@"kanryou" forState:UIControlStateNormal];
//        
//        doneButton.tintColor = [UIColor colorWithRed:0.514 green:0.573 blue:0.573 alpha:1];
//        [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
//        [hideView addSubview:doneButton];
//        
//        [self.view addSubview:hideView];
//    }
//    [UIView animateWithDuration:0.3 animations:^{
//        CGRect frame = hideView.frame;
//        frame.origin.y = self.view.frame.size.height - frame.size.height;
//        hideView.frame = frame;
//    }completion:^(BOOL finished) {
//        
//    }];
//    
//}
-(void)done:(UIButton*)button{

    
    [UIView animateWithDuration:0.3 animations:^{
        hideView.center = CGPointMake(160, self.view.frame.size.height+hideView.frame.size.height);
    }completion:^(BOOL finished){
    }];
}
-(void)cancel:(UIButton*)button{
    [UIView animateWithDuration:0.3 animations:^{
        hideView.center = CGPointMake(160, self.view.frame.size.height+hideView.frame.size.height);
    }completion:^(BOOL finished){
    
    }];
}
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, pickerView.frame.size.height)];
//    
//    label.numberOfLines = 0;//改行数無制限
//    
//    label.text = @"テキ\nスト";
//     label.text = @"fi\nle";
//    
//    label.font = [UIFont boldSystemFontOfSize:10];//フォントサイズ変更
//    
//    return label;
//}
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        //[tView setTextAlignment:UITextAlignmentLeft];
        tView.numberOfLines=3;
        NSArray *arr = [[NSArray alloc]initWithObjects:@"なし",@"41cm砲",@"46cm砲",@"35.6cm砲",@"15.5cm砲", nil];
        tView.text = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];

    }
    
    
    return tView;
    
}
@end
