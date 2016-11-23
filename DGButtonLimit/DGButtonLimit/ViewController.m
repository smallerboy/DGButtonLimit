//
//  ViewController.m
//  DGButtonLimit
//
//  Created by 张一力 on 2016/11/22.
//  Copyright © 2016年 张一力DGCompany. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+ButtonLimit.h"

#import "ExampleViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.button];
}

- (UIButton *)button{
    
    if (!_button) {
        _button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,200,50)];
        [_button setCenter:self.view.center];
        _button.backgroundColor = [UIColor redColor];
        [_button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        _button.acceptEventInterval = 2;
    }
    return _button;
}

- (void)touchButton:(UIButton *)btn{
    [NSDate date];
    NSLog(@"点击按钮%@",[NSDate date]);
    ExampleViewController *example = [[ExampleViewController alloc]init];
    [self.navigationController pushViewController:example animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
