//
//  UIBarButtonItem+CYXExtension.m
//  CYXBuDeJie
//
//  Created by Macx on 15/9/29.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "UIBarButtonItem+CYXExtension.h"

@implementation UIBarButtonItem (CYXExtension)

/**
 *  自定义UIBarButtonItem
 *
 *  @param image      普通状态下的图片
 *  @param hightImage 高亮状态下的图片
 *  @param target     设置监听对象
 *  @param action     设置监听点击事件
 *
 *  @return 设置好的UIBarButtonItem
 */
+ (instancetype)itemWithimageName:(NSString *)image highlightImage:(NSString *)hightImage target:(id)target action:(SEL)action
{
    // 设置左上角按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView: button];
}

@end
