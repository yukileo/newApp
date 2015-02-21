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
@property (strong, nonatomic) IBOutlet QBFlatButton *button5;
@property (strong, nonatomic) IBOutlet UITextView *contentField;
@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextField *titleField2;
@property (strong, nonatomic) IBOutlet UIButton *firstButton;
@property (strong, nonatomic) IBOutlet UIButton *secondButton;
@property (strong, nonatomic) IBOutlet UIImageView *kanmusu;

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
    IBOutlet UILabel *sum3;
    
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
    
    _button5 = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    _button5.frame = CGRectMake(20, 130 - 20 - 40, 80, 60);
    _button5.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    _button5.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _button5.radius = 8.0;
    _button5.margin = 4.0;
    _button5.depth = 3.0;
    
    
    _button5.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button5 setTitle:@"艦娘" forState:UIControlStateNormal];
    
    [_button5 addTarget:self action:@selector(button5) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button5];


    picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, picker.frame.size.width, picker.frame.size.width)];
//    picker.tag=1;
    
//    picker2 = [[UIPickerView alloc]init];initWithFrame:CGRectMake(0, 20, picker.frame.size.width, picker.frame.size.width);
//    picker2.tag=2;
//    // デリゲートを設定
    picker.delegate = self;
    
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
//    picker.tag = 5;
    
    
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
    int r = [ud integerForKey:@"meityu"];
    sum3.text = [NSString stringWithFormat:@"%d",r];
    int KNMS =[ud integerForKey:@"b5-KNMS"];
    if (KNMS == 1) {
        _kanmusu.image = [UIImage imageNamed:@"1.png"];
    }if (KNMS == 2) {
        _kanmusu.image = [UIImage imageNamed:@"2.png"];
    }if (KNMS == 3) {
        _kanmusu.image = [UIImage imageNamed:@"3.png"];
    }if (KNMS ==4) {
        _kanmusu.image = [UIImage imageNamed:@"4.png"];
    }if (KNMS == 5) {
        _kanmusu.center =  CGPointMake(150,600);
        _kanmusu.image = [UIImage imageNamed:@"5.png"];
    }if (KNMS == 6) {
        
        _kanmusu.image = [UIImage imageNamed:@"6.png"];
    }if (KNMS == 7) {
        _kanmusu.image = [UIImage imageNamed:@"7.png"];
    }
    NSString *s = [ud stringForKey:@"Num1"];
    [_button1 setTitle: s forState:UIControlStateNormal];
    NSString *t = [ud stringForKey:@"Num2"];
    [_button2 setTitle: t forState:UIControlStateNormal];
    NSString *u = [ud stringForKey:@"Num3"];
    [_button3 setTitle: u forState:UIControlStateNormal];
    NSString *v = [ud stringForKey:@"Num4"];
    [_button4 setTitle: v forState:UIControlStateNormal];
    NSString *w = [ud stringForKey:@"Num5"];
    [_button5 setTitle: w forState:UIControlStateNormal];
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
    if(TheNum == 5){
        return 8;
    }else {
        return 5;
    }
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


//
//- (NSString *)pickerView:(UIPickerView *)pickerView
//             titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    NSArray * arr;
//
//    if(TheNum <= 4){
//        arr = [[NSArray alloc]initWithObjects:@"なし",@"41cm砲",@"46cm砲",@"35.6cm砲",@"15.5cm砲", nil];
//        return [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
//
//    }else{
//        arr = [[NSArray alloc]initWithObjects:@"KNGU",@"HIE",@"HRN",@"KRSM",@"NGT",@"MT",@"IS",@"HYG", nil];
//        return [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
//     
//    }
//}



- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel* tView = (UILabel*)view;
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        //[tView setTextAlignment:UITextAlignmentLeft];
        tView.numberOfLines=3;
        NSArray * arr;
        if(TheNum <= 4){
            arr = [[NSArray alloc]initWithObjects:@"なし",@"41cm砲",@"46cm砲",@"35.6cm砲",@"15.5cm砲", nil];
        }else if(TheNum==5){
            arr = [[NSArray alloc]initWithObjects:@"金剛",@"比叡",@"榛名",@"霧島",@"長門",@"陸奥",@"伊勢",@"日向", nil];
        }
        tView.text = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        
    }
    return tView;
    
}


- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    

    if(TheNum == 1){
    // 1列目の選択された行数を取得
    NSInteger vala_1 = [pickerView selectedRowInComponent:0];
        NSInteger vala_2 = [pickerView selectedRowInComponent:0];
        NSInteger vala_3= [pickerView selectedRowInComponent:0];
        if(row == 0){
            vala_1 = 0;
            vala_2 = 0;
            vala_3 = 0;
            [ud setObject:@"なし" forKey:@"Num1"];
            [_button1 setTitle:@"なし" forState:UIControlStateNormal];
        }
        if(row == 1){
            vala_1 = 20;
            vala_2 = 4;
            vala_3 = 0;
            [ud setObject:@"41cm砲" forKey:@"Num1"];
            [_button1 setTitle:@"41cm砲" forState:UIControlStateNormal];
        }
        if(row == 2){
            vala_1 = 26;
            vala_2 = 5;
            vala_3 = 0;
            [ud setObject:@"46cm砲" forKey:@"Num1"];
            [_button1 setTitle:@"46cm砲" forState:UIControlStateNormal];
        }
        if(row == 3){
            vala_1 = 15;
            vala_2 = 4;
            vala_3 = 0;
            [ud setObject:@"35.6cm砲" forKey:@"Num1"];
            [_button1 setTitle:@"35.6cm砲" forState:UIControlStateNormal];
        }
        if(row == 4){
            vala_1 = 7;
            vala_2 = 4;
            vala_3 = 1;
            [ud setObject:@"15.5cm砲" forKey:@"Num1"];
            [_button1 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        [ud setInteger:vala_1 forKey:@"b1"];
        [ud setInteger:vala_2 forKey:@"b1-2"];
        [ud setInteger:vala_3 forKey:@"b1-3"];
        
     [ud synchronize];
    
    
//sum.text = [NSString
//                stringWithFormat:@"%ld",(long)val1];/Users/yuki/Desktop/newMyApp/newMyApp.xcodeproj
 
    }
    if(TheNum == 2){
        // 1列目の選択された行数を取得
        
       
        NSInteger valb_1 = [pickerView selectedRowInComponent:0];
        NSInteger valb_2 = [pickerView selectedRowInComponent:0];
         NSInteger valb_3 = [pickerView selectedRowInComponent:0];
        if(row == 0){
            valb_1 = 0;
            valb_2 = 0;
            valb_3 = 0;
            [ud setObject:@"なし" forKey:@"Num2"];
            [_button2 setTitle:@"なし" forState:UIControlStateNormal];
        }
        if(row == 1){
            valb_1 = 20;
            valb_2 = 4;
            valb_3 = 0;
            [ud setObject:@"41cm砲" forKey:@"Num2"];
            [_button2 setTitle:@"41cm砲" forState:UIControlStateNormal];
        }
        if(row == 2){
            valb_1 = 26;
            valb_2 = 5;
            valb_3 = 0;
            [ud setObject:@"46cm砲" forKey:@"Num2"];
            [_button2 setTitle:@"46cm砲" forState:UIControlStateNormal];
        }
        if(row == 3){
            valb_1 = 15;
            valb_2 = 4;
            valb_3 = 0;
            [ud setObject:@"35.6cm砲" forKey:@"Num2"];
            [_button2 setTitle:@"35.6cm砲" forState:UIControlStateNormal];
        }
        if(row == 4){
            valb_1 = 7;
            valb_2 = 4;
            valb_3 = 1;
            [ud setObject:@"15.5cm砲" forKey:@"Num2"];
            [_button2 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        [ud setInteger:valb_1 forKey:@"b2"];
        [ud setInteger:valb_2 forKey:@"b2-2"];
        [ud setInteger:valb_3 forKey:@"b2-3"];
        
        [ud synchronize];
        

        
        


    }
    if(TheNum == 3){
        // 1列目の選択された行数を取得
        
        
        NSInteger valc_1 = [pickerView selectedRowInComponent:0];
        NSInteger valc_2 = [pickerView selectedRowInComponent:0];
        NSInteger valc_3 = [pickerView selectedRowInComponent:0];
        if(row == 0){
            valc_1 = 0;
            valc_2 = 0;
            valc_3 = 0;
            [ud setObject:@"なし" forKey:@"Num3"];
            [_button3 setTitle:@"なし" forState:UIControlStateNormal];
        }
        if(row == 1){
            valc_1 = 20;
            valc_2 = 4;
            valc_3 = 0;
            [ud setObject:@"41cm砲" forKey:@"Num3"];
            [_button3 setTitle:@"41cm砲" forState:UIControlStateNormal];
        }
        if(row == 2){
            valc_1 = 26;
            valc_2 = 5;
            valc_3 = 0;
            [ud setObject:@"46cm砲" forKey:@"Num3"];
            [_button3 setTitle:@"46cm砲" forState:UIControlStateNormal];
        }
        if(row == 3){
            valc_1 = 15;
            valc_2 = 4;
            valc_3 = 0;
            [ud setObject:@"35.6cm砲" forKey:@"Num3"];
            [_button3 setTitle:@"35.6cm砲" forState:UIControlStateNormal];
        }
        if(row == 4){
            valc_1 = 7;
            valc_2 = 4;
            valc_3 = 1;
            [ud setObject:@"15.5cm砲" forKey:@"Num3"];
            [_button3 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        [ud setInteger:valc_1 forKey:@"b3"];
        [ud setInteger:valc_2 forKey:@"b3-2"];
        [ud setInteger:valc_3 forKey:@"b3-3"];
        
        [ud synchronize];
        
        

        
        
    }
    if(TheNum == 4){
        // 1列目の選択された行数を取得
        
        
        NSInteger vald_1 = [pickerView selectedRowInComponent:0];
        NSInteger vald_2 = [pickerView selectedRowInComponent:0];
        NSInteger vald_3 = [pickerView selectedRowInComponent:0];
        if(row == 0){
            vald_1 = 0;
            vald_2 = 0;
            vald_3 = 0;
            [ud setObject:@"なし" forKey:@"Num4"];
            [_button4 setTitle:@"なし" forState:UIControlStateNormal];
        }
        if(row == 1){
            vald_1 = 20;
            vald_2 = 4;
            vald_3 = 0;
            [ud setObject:@"41cm砲" forKey:@"Num4"];
            [_button4 setTitle:@"41cm砲" forState:UIControlStateNormal];
        }
        if(row == 2){
            vald_1 = 26;
            vald_2 = 5;
            vald_3 = 0;
            [ud setObject:@"46cm砲" forKey:@"Num4"];
            [_button4 setTitle:@"46cm砲" forState:UIControlStateNormal];
        }
        if(row == 3){
            vald_1 = 15;
            vald_2 = 4;
            vald_3 = 0;
            [ud setObject:@"35.6cm砲" forKey:@"Num4"];
            [_button4 setTitle:@"35.6cm砲" forState:UIControlStateNormal];
        }
        if(row == 4){
            vald_1 = 7;
            vald_2 = 4;
            vald_3 = 1;
            [ud setObject:@"15.5cm砲" forKey:@"Num4"];
            [_button4 setTitle:@"15.5cm砲" forState:UIControlStateNormal];
        }
        [ud setInteger:vald_1 forKey:@"b4"];
        [ud setInteger:vald_2 forKey:@"b4-2"];
        [ud setInteger:vald_3 forKey:@"b4-3"];
        
        [ud synchronize];
        

        
        
    }
    if(TheNum == 5){
        // 1列目の選択された行数を取得
      
        
        NSInteger val1 = [pickerView selectedRowInComponent:0];
        NSInteger val2 = [pickerView selectedRowInComponent:0];
        NSInteger valKNMS = [pickerView selectedRowInComponent:0];
        if(row == 0){
            val1 = 63;
            val2 = 24;
            valKNMS = 2;
      NSLog(@"kanmusu1-1");
            //kanmusu = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
           _kanmusu.image = [UIImage imageNamed:@"2.png"];
           _kanmusu.center =  CGPointMake(120,600);
//            imageView.frame = CGRectMake(0, 0, 300, 400);
//            imageView.center =  CGPointMake(160, 240);
//            imageView.tag = 10;
//            [self.view addSubview:_kanmusu];
            [ud setObject:@"金剛" forKey:@"Num5"];
            [_button5 setTitle:@"金剛" forState:UIControlStateNormal];
            NSLog(@"kanmusu1-2");
        }
        if(row == 1){
            val1 = 63;
            val2 = 24;
            valKNMS = 6;
           _kanmusu.image = [UIImage imageNamed:@"6.png"];
           _kanmusu.center =  CGPointMake(110,600);
//            imageView.frame = CGRectMake(0, 0, 300, 400);
//            imageView.center =  CGPointMake(160, 240);
//            imageView.tag = 10;
//            [self.view addSubview:_kanmusu];
            [ud setObject:@"比叡" forKey:@"Num5"];
            [_button5 setTitle:@"比叡" forState:UIControlStateNormal];
            NSLog(@"kanmusu2");
        }
        if(row == 2){
            val1 = 63;
            val2 = 24;
            valKNMS = 5;
             _kanmusu.image = [UIImage imageNamed:@"5.png"];
             _kanmusu.center =  CGPointMake(150,600);
            [ud setObject:@"榛名" forKey:@"Num5"];
            [_button5 setTitle:@"榛名" forState:UIControlStateNormal];
            
        }
        if(row == 3){
            val1 = 63;
            val2 = 24;
            valKNMS = 4;
             _kanmusu.image = [UIImage imageNamed:@"4.png"];
             _kanmusu.center =  CGPointMake(150,600);
            [ud setObject:@"霧島" forKey:@"Num5"];
            [_button5 setTitle:@"霧島" forState:UIControlStateNormal];
            
        }
        if(row == 4){
            val1 = 82;
            val2 = 31;
            valKNMS = 7;
            _kanmusu.image = [UIImage imageNamed:@"7.png"];
            _kanmusu.center =  CGPointMake(120,600);
            
            
            [ud setObject:@"長門" forKey:@"Num5"];
            [_button5 setTitle:@"長門" forState:UIControlStateNormal];
            
        }
        if(row == 5){
            val1 = 82;
            val2 = 32;
            valKNMS = 8;
            _kanmusu.image = [UIImage imageNamed:@"8.png"];
            _kanmusu.center =  CGPointMake(120,600);
            [ud setObject:@"陸奥" forKey:@"Num5"];
            [_button5 setTitle:@"陸奥" forState:UIControlStateNormal];
            
        }
        if(row == 6){
            val1 = 74;
            val2 = 28;
            valKNMS = 1;
            _kanmusu.image = [UIImage imageNamed:@"1.png"];
            _kanmusu.center =  CGPointMake(120,600);
            [ud setObject:@"伊勢" forKey:@"Num5"];
            [_button5 setTitle:@"伊勢" forState:UIControlStateNormal];
            
        }
        if(row == 7){
            val1 = 74;
            val2 = 28;
            valKNMS = 3;
            _kanmusu.image = [UIImage imageNamed:@"3.png"];
            _kanmusu.center =  CGPointMake(110,600);
            [ud setObject:@"日向" forKey:@"Num5"];
            [_button5 setTitle:@"日向" forState:UIControlStateNormal];
            
        }
        [ud setInteger:val1 forKey:@"b5"];
        [ud setInteger:val2 forKey:@"b5-2"];
        [ud setInteger:valKNMS forKey:@"b5-KNMS"];
        
        [ud synchronize];
        
        
        
    }
    

    int a = [ud integerForKey:@"b1"];  // KEY_Iの内容をint型として取得
   
    
    int b = [ud integerForKey:@"b2"];  // KEY_Iの内容をint型として取得
    

    int c = [ud integerForKey:@"b3"];  // KEY_Iの内容をint型として取得
    

    
    int d = [ud integerForKey:@"b4"];  // KEY_Iの内容をint型として取得
    
    int k = [ud integerForKey:@"b5"];
    
    int e = [ud integerForKey:@"b1-2"];
        int f = [ud integerForKey:@"b2-2"];
    
    int g = [ud integerForKey:@"b3-2"];
   
    int h = [ud integerForKey:@"b4-2"];
    int j = [ud integerForKey:@"b5-2"];
    int p = [ud integerForKey:@"b1-3"];

    int l = [ud integerForKey:@"b2-3"];

    int m = [ud integerForKey:@"b3-3"];

    int n = [ud integerForKey:@"b4-3"];
    int o = [ud integerForKey:@"b5-3"];

    
   [ud synchronize];
    
    
    
    
    sum.text = [NSString stringWithFormat:@"%d",a + b + c + d + k];
    sum2.text = [NSString stringWithFormat:@"%d",e + f + g + h + j];
    sum3.text = [NSString stringWithFormat:@"%d",l + m + n+ o + p];
    
    
    int i = sum.text.intValue;
    [ud setInteger:i forKey: @"fire"];
    int q = sum2.text.intValue;
    [ud setInteger:n forKey:@"taiku"];
    int r = sum3.text.intValue;
    [ud setInteger:n forKey:@"meityu"];
    [ud synchronize];
}





-(IBAction)button1{
    TheNum = 1;
    [self selectlimit];
    
    
}
-(IBAction)button2{
    TheNum = 2;
    [self selectlimit];
}
-(IBAction)button3{
    TheNum = 3;
  [self selectlimit];
}
-(IBAction)button4{
    TheNum = 4;
    [self selectlimit];

}
-(IBAction)button5{
    TheNum = 5;
    [self selectlimit];

//    picker.tag
}

-(void)selectlimit{
    [picker reloadAllComponents];
    
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


@end
