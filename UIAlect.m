//
//  UIAlect.m
//  UIAlect-Package-demo
//
//  Created by 李小强 on 2016/12/6.
//  Copyright © 2016年 李小强. All rights reserved.
//

#import "UIAlect.h"
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface UIAlect ()
@property(nonatomic,retain)UIView *alertView;
@property(nonatomic,retain)UILabel *titleLab;
@property(nonatomic,retain)UILabel *contentLab;
@property(nonatomic,retain)UIButton *cancelBtn;
@property(nonatomic,retain)UIButton *sureBtn;

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *cancel;
@property(nonatomic,copy)NSString *sure;


@end

@implementation UIAlect
//init 方法中 写控件
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
    ///title
    _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.textColor = [UIColor blackColor];
    [self addSubview:_titleLab];
    
    ///content
    _contentLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLab.frame), self.bounds.size.width, 50)];
    _contentLab.textAlignment = NSTextAlignmentCenter;
    _contentLab.textColor = [UIColor redColor];
    [self addSubview:_contentLab];
    ///取消按钮
    _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_contentLab.frame), self.bounds.size.width/2, 50)];
        _cancelBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _cancelBtn.layer.borderWidth = 0.5;
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtClik) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_cancelBtn];
        ///确认按钮
        
        _sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width/2, CGRectGetMaxY(_contentLab.frame), self.bounds.size.width/2, 50)];
        _sureBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _sureBtn.layer.borderWidth = 0.5;
        [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureBtClik) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_sureBtn];
    }
    
    return self;
    
}

#pragma mark - 取消按钮点击事件
-(void)cancelBtClik{
    [self removeFromSuperview];
    self.cancel_block();
}

#pragma mark - 确定按钮点击事件
-(void)sureBtClik{
    [self removeFromSuperview];
    self.sure_block();
}

#pragma mark - 封装方法
+(instancetype)alectViewWithTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancel sure:(NSString *)sure cancelBtClick:(cancelBlock)cancelBlock sureBtClick:(sureBlock)sureBlock{
    //对于弹框大小的设置
    UIAlect *alert = [[UIAlect alloc]initWithFrame:CGRectMake(0, 0, 250, 150)];
    alert.backgroundColor = [UIColor whiteColor];
    //弹框的位置的设置
    alert.center = CGPointMake(WIDTH/2, HEIGHT/2);
    alert.layer.cornerRadius = 5;
    alert.layer.masksToBounds = YES;
    alert.title = title;
    alert.content = content;
    alert.cancel = cancel;
    alert.sure = sure;
    alert.cancel_block = cancelBlock;
    alert.sure_block = sureBlock;
    return alert;
}
#pragma mark - 对于所有的属性重新赋值

-(void)setTitle:(NSString *)title{
    _titleLab.text = title;
}
-(void)setContent:(NSString *)content{
    _contentLab.text = content;
}
-(void)setCancel:(NSString *)cancel{
    [_cancelBtn setTitle:cancel forState:UIControlStateNormal];
}
-(void)setSure:(NSString *)sure{
    
    [_sureBtn setTitle:sure forState:UIControlStateNormal];

}
@end
