//
//  ViewController.m
//  UIAlect-Package-demo
//
//  Created by 李小强 on 2016/12/6.
//  Copyright © 2016年 李小强. All rights reserved.
//

#import "ViewController.h"
#import "UIAlect.h"
@interface ViewController ()
{
    UIButton *button;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(setOnClick:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)setOnClick:(UIButton *)btn{
    UIAlect *alert = [UIAlect alectViewWithTitle:@"提示" content:@"是否登陆" cancel:@"取消" sure:@"登陆" cancelBtClick:^{
        NSLog(@"您没有登陆");
    } sureBtClick:^{
        NSLog(@"进入下一层验证，请稍后");
    }];
    
    [self.view addSubview:alert];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
