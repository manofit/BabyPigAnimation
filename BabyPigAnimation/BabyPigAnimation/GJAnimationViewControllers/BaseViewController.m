//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  BaseViewController.m
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.babyView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, SCREEN_HEIGHT/2-100,100 ,100)];
    self.babyView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.babyView];
    
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, SCREEN_HEIGHT-80, 60, 30)];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    startBtn.backgroundColor = [UIColor grayColor];
    [startBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
}

-(void)btnClicked:(UIButton *)btn{
    
}

@end
