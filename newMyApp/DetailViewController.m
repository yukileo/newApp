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
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
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

- (void)showPicker {
	//ピッカーが下から出るアニメーション
    //中央に表示
    picker.center = self.view.center;
    
    //画面に追加
    [self.view addSubview:picker];
	
    //	//ナビゲーションバーの右上にdoneボタンを設置する
    //	if (!self.navigationItem.rightBarButtonItem) {
    //        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    //        [self.navigationItem setRightBarButtonItem:done animated:YES];
    //    }
    //    aItemList = [[NSMutableArray alloc] initWithObjects:@"a",@"b",@"c",@"d", @"e",nil];
}

//- (void)setDetailItem:(id)newD;etailItem
//{
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//
//        // Update the view.
//        [self configureView];
//           }
//}

- (void)configureView
{
    //    // Update the user interface for the detail item.
    //
    //    if (self.detailItem) {
    //        NSURL *FURL=(NSURL *)self.detailItem;
    //        NSDictionary *dic=[NSDictionary dictionaryWithContentsOfURL:FURL];
    //        self.titleField2.text=dic[@"title"];
    //        self.contentField.text=dic[@"body"];
    //    }
    //
    //
    //
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //	// Do any additional setup after loading the view, typically from a nib.
    //    [self configureView];
    //
    //    detailContents = [NSMutableDictionary dictionary];
    //
    //    self.titleField.tag = 1;
    //    self.textField3.tag = 2;
    //    self.titleField2.tag = 3;
    //
    //    picker = [[UIPickerView alloc] init];
    //    picker.frame = CGRectMake(0, 650, 320, 216);
    //    picker.showsSelectionIndicator = YES;
    //    picker.delegate = self;
    //    picker.dataSource = self;
    ////    [self.view addSubview:picker];
    //
    //    _textField3.delegate = self;
    //
    //    fieldValue = 0;
    // UIPickerのインスタンス化
    picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, picker.frame.size.width, picker.frame.size.width)];
    
    picker = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
//    [self.view addSubview:picker];
    
    picker2 = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, picker.frame.size.width, picker.frame.size.width)];
    
    picker2 = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker2.delegate = self;
    
    // データソースを設定
    picker2.dataSource = self;
    
    // 選択インジケータを表示
    picker2.showsSelectionIndicator = YES;
    
    picker.tag = 1;
    
    picker2.tag = 1;
    
    _firstButton.tag = 3;
    
    _secondButton.tag = 4;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)saveData
//{
//    NSURL *FURL=(NSURL *)self.detailItem;
//    NSDictionary *dic=@{@"title":self.titleField2.text,@"body":self.contentField.text};
//    [dic writeToURL:FURL atomically:YES];
//}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //    [self saveData];
    if(textField.tag == 3){
        //titleTextFieldの処理
        number = [self.titleField2
                  .text intValue];
        
        if(number > 100){
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"警告"
                                  message:@"最大値をこえてます"
                                  delegate:self
                                  cancelButtonTitle:@"確認"
                                  otherButtonTitles:nil];
            alert.alertViewStyle = UIAlertViewStyleDefault;
            [alert show];
            self.titleField2.delegate = self;
            self.titleField2.returnKeyType = UIReturnKeyDone;
            textField.layer.borderWidth = 1;
            textField.layer.borderColor = [[UIColor blackColor]CGColor];
            
            
            [detailContents setObject:textField.text forKey:@"title"];
            
            
            
            NSString *contentsKey = [NSString stringWithFormat:@"title%@",_contentsNumber];
            [[NSUserDefaults standardUserDefaults] setObject:[detailContents copy] forKey:contentsKey];
            
            
            
            //NSString *contentsKey = [NSString stringWithFormat:@"title%d",_contentsNumber];
            //[[NSUserDefaults standardUserDefaults] setObject: forKey:@"title"];
        }
    }else if (textField.tag==3){
        
        
    }
    
}

///* ---- ここからpicker あべ ---- */
//-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    return 1;
//    // ピッカーに表示する列数
//}
//
//-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    return  10;
//    // ピッカーに表示する行数
//}
//
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e", nil];
//
//    return [array1 objectAtIndex:row];
//}
//



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

/**
 * ピッカーに表示する値を返す
 */
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
        case 2: // 3列目
            return [NSString stringWithFormat:@"%d列-%d行", (long)row];
            break;
            
        default:
            return 0;
            break;
    }
}


/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(picker.tag == 1){
    // 1列目の選択された行数を取得
    NSInteger val0 = [pickerView selectedRowInComponent:0];
    
    // 2列目の選択された行数を取得
//    NSInteger val1 = [pickerView selectedRowInComponent:1];
    
    //    // 3列目の選択された行数を取得
    //    NSInteger val2 = [pickerView selectedRowInComponent:2];
    
    NSLog(@"1列目:%d行目が選択", val0);
    
    
    sum.text = [NSString stringWithFormat:@"%ld",(long)val0];
    //    NSLog(@"2列目:%d行目が選択", val1);
    //    NSLog(@"3列目:%d行目が選択", val2);
    }
    if(picker.tag == 2){
        // 1列目の選択された行数を取得
        NSInteger val1 = [pickerView selectedRowInComponent:0];
        
        // 2列目の選択された行数を取得
        //    NSInteger val1 = [pickerView selectedRowInComponent:1];
        
        //    // 3列目の選択された行数を取得
        //    NSInteger val2 = [pickerView selectedRowInComponent:2];
        
        NSLog(@"1列目:%d行目", (long)val1);
    
        
        sum.text = [NSString stringWithFormat:@"%ld",(long)val1];
        //    NSLog(@"2列目:%d行目が選択", val1);
        //    NSLog(@"3列目:%d行目が選択", val2);
    }}

//- (void)done:(id)sender {
//	//ピッカーをしまう
//	[self hidePicker];

//doneボタンを消す
//    [self.navigationItem setRightBarButtonItem:nil animated:YES];
//}
//- (void)hidePicker {
//	//ピッカーを下に隠すアニメーション
//	[UIView beginAnimations:nil context:NULL];
//	[UIView setAnimationDuration:0.2];
//	[UIView setAnimationDelegate:self];
//	picker.frame = CGRectMake(0, 650
//                              , 320, 216);
//	[UIView commitAnimations];
//}
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//{
//    //表示文字数
//    return 1;
//}
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{
//行数
//    return 101;
//    return [aItemList count];
//
//}
//- (NSString *)pickerView:(UIPickerView *)pickerView
//             titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    switch (component) {
//        case 0: // 1列目
//            return [NSString stringWithFormat:@"aaa", row];
//            return [NSString stringWithFormat:@"bbb", row];
//            return [NSString stringWithFormat:@"ccc", row];
//            break;
//
//
//
//        default:
//            return 0;
//            break;
//    }
//}

//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    return [NSString stringWithFormat:@"%ld",aItemList];
//}
//- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//{
//    //_label.text = [NSString stringWithFormat:@"%d",row];
//
//    NSString *contentsKey = [NSString stringWithFormat:@"title%d",_contentsNumber.intValue];
//
//    NSMutableDictionary *contentsDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:contentsKey] mutableCopy];
//
//    detailContents = contentsDictionary;
//
//    switch (fieldValue) {
//        case 1:
//            self.titleField.text = [NSString stringWithFormat:@"%@",aItemList];
//
//           // [[NSUserDefaults standardUserDefaults] setInteger:row forKey:@"picker2"];
//
//            [detailContents setObject:[[NSNumber alloc] initWithInt:(int)row] forKey:@"picker2"];
//            NSLog(@"case1%d",(int)row);
//
//            break;
//
//        case 2:
//            self.textField3.text = [NSString stringWithFormat:@"%@",aItemList];
//
//            [detailContents setObject:[[NSNumber alloc] initWithInt:(int)row] forKey:@"picker"];
//            NSLog(@"case2%d",(int)row);
//            //[[NSUserDefaults standardUserDefaults] setInteger:row forKey:@"picker"];
//
//            break;
//        default:
//            break;
//    }
//
//    NSLog(@"-------");
//
//    [[NSUserDefaults standardUserDefaults] setObject:[detailContents copy] forKey:contentsKey];
//
//    self.titleField.text = [NSString stringWithFormat:@"%ld",(long)row];

//}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //テキストフィールドの編集を始めるときに、ピッカーを呼び出す。
    //    fieldValue = textField.tag;
    
    
    [self showPicker];
    
    //キーボードは表示させない
    return NO;
}
//
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    switch (buttonIndex) {
//        case 0:
//            number = 100;
//            self.titleField2.text = [NSString stringWithFormat:@"%d",number];
////            [self saveData];
//            NSLog(@"ケース1");
//        break;
//    }
//
//    NSLog(@"%d",number);
//}
/*
 -(void)textViewDidEndEditing:(UITextView *)textView
 {
 [self saveData];
 }
 */


//-(void)viewDidAppear:(BOOL)animated{
//
//
//    //picker という合言葉で呼び出す
//    //http://stackoverflow.com/questions/1482097/how-do-you-save-an-integer-to-nsuserdefaults
//
//
//    NSLog(@"title%d",_contentsNumber.intValue);
//
//    NSString *contentsKey = [NSString stringWithFormat:@"title%d",_contentsNumber.intValue];
//
//    NSMutableDictionary *contentsDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:contentsKey] mutableCopy];
//
//    //NSInteger pickerNum = [[NSUserDefaults standardUserDefaults] integerForKey:@"picker"];
//    //NSInteger pickerNum2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"picker2"];
//
//    int pickerNum;
//    int pickerNum2;
//
//    if(contentsDictionary){
//        pickerNum = ((NSNumber*)contentsDictionary[@"picker2"]).intValue;
//        pickerNum2 = ((NSNumber *)contentsDictionary[@"picker"]).intValue;
//    }
////    else{
////        pickerNum = 0;
////        pickerNum2 = 0;
////        NSLog(@"%d",pickerNum2);
////    }
//    NSLog(@"%d",pickerNum);
//    NSLog(@"%d",pickerNum2);
//
//     _textField3.text = [NSString stringWithFormat:@"%d",pickerNum];
//
//    _titleField.text = [NSString stringWithFormat:@"%d",pickerNum2];
//
//}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    // 最大入力文字数
//    int maxInputLength = 50;
//    switch (textField.tag) {
//        case 1:
////            switch (textField.tag == 3)
//
//             case 2:
//             case 3:
//        case 4:
//            [self showPicker];
//
//            break;
//
//        default:
//            break;
//    }
//
//    // 入力済みのテキストを取得
//    NSMutableString *str = [textField.text mutableCopy];
//    
//    // 入力済みのテキストと入力が行われたテキストを結合
//    [str replaceCharactersInRange:range withString:string];
//    
//    if ([str length] > maxInputLength) {
//        return NO;
//    }
//    
//    return YES;
//}

-(IBAction)button1{
    [self selectlimit];
}
-(IBAction)button2{
    [self selectlimit];
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
-(void)done:(UIButton*)button{
//    [UIView animateWithDuration:0.3 animations:^{
//                         
//    completion:^(BOOL finished) {
//         
//    }];
    
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
