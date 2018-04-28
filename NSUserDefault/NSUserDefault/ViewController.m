//
//  ViewController.m
//  NSUserDefault
//
//  Created by peace on 2018/4/26.
//  Copyright © 2018 peace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self saveButton:0];
    [self outputButton:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark --
- (void)saveButton:(int)index {
    float y = [UIApplication sharedApplication].statusBarFrame.size.height + index * 50;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, y, self.view.frame.size.width, 40)];
    [button setBackgroundColor:[UIColor purpleColor]];
    [button setTitle:@"Save" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)saveAction {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:@"abcdefg" forKey:@"key_string"];
    [userDefault setObject:[NSNumber numberWithInt:3] forKey:@"key_number"];
    [userDefault setObject:[NSArray arrayWithObjects:@"1",@"2",@"3", nil] forKey:@"key_array"];
    [userDefault setObject:UIImageJPEGRepresentation([UIImage imageNamed:@"1.png"], 100) forKey:@"key_image"];
    
    [userDefault setValue:@"" forKey:@"key_value"];
    
    [userDefault setBool:YES forKey:@"key_yes"];
    [userDefault setBool:NO forKey:@"key_no"];
    [userDefault setInteger:11 forKey:@"key_integer"];
    [userDefault setFloat:3.1415926 forKey:@"key_float"];
    [userDefault setDouble:2.00005555 forKey:@"key_double"];
    [userDefault setURL:[NSURL URLWithString:@"https://www.baidu.cn"] forKey:@"key_url"];
    
    [userDefault synchronize];
}

- (void)outputButton:(int)index {
    float y = [UIApplication sharedApplication].statusBarFrame.size.height + index * 50;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, y, self.view.frame.size.width, 40)];
    [button setBackgroundColor:[UIColor purpleColor]];
    [button setTitle:@"Output" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(outputAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)outputAction {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSLog(@"key_yes = %d",[userDefault boolForKey:@"key_yes"]);
    NSLog(@"key_no = %d",[userDefault boolForKey:@"key_no"]);
    NSLog(@"key_integer = %ld",[userDefault integerForKey:@"key_integer"]);
    NSLog(@"key_float = %f",[userDefault floatForKey:@"key_float"]);
    NSLog(@"key_double = %f",[userDefault doubleForKey:@"key_double"]);
    NSLog(@"key_url = %@",[userDefault URLForKey:@"key_url"]);
    
    NSLog(@"key_string = %@",[userDefault objectForKey:@"key_string"]);
    NSLog(@"key_number = %@",[userDefault objectForKey:@"key_number"]);
    NSLog(@"key_array = %@",[userDefault objectForKey:@"key_array"]);
    
    NSData *imageData = [userDefault dataForKey:@"key_image"];
    UIImage *image = [UIImage imageWithData:imageData];
    NSLog(@"key_image = %@",image);
}

@end
