//
//  UIAlect.h
//  UIAlect-Package-demo
//
//  Created by 李小强 on 2016/12/6.
//  Copyright © 2016年 李小强. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 其实typedef 就类似于结构体  自己定义的一个数据类型罢了  例如 NSString 等

///取消按钮点击事件
typedef void (^cancelBlock)();
///确定按钮的点击事件
typedef void (^sureBlock)();


@interface UIAlect : UIView

@property(nonatomic,copy)cancelBlock cancel_block;
@property(nonatomic,copy)sureBlock sure_block;

# pragma mark - 封装的方法

+(instancetype)alectViewWithTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancel sure:(NSString *)sure cancelBtClick :(cancelBlock)cancelBlock sureBtClick:(sureBlock)sureBlock;
@end
