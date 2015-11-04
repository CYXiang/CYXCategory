//
//  UIImage+CYXExtension.m
//  CYXBuDeJie
//
//  Created by Macx on 15/10/10.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "UIImage+CYXExtension.h"

@implementation UIImage (CYXExtension)

/**
 *  画圆图片裁剪
 *
 *  @return 裁剪完成的图片
 */
- (instancetype)circleImage{
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    // 添加路径到上下文
    CGContextAddEllipseInRect(context, rect);
    
    // 裁剪（根据添加到上下文中的路径进行裁剪）
    // 以后超出裁剪后形状的内容都看不见
    CGContextClip(context);
    
    // 绘制图片到上下文中
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)circleImageNamed:(NSString *)name{
    return [[self imageNamed:name] circleImage];
}

@end
