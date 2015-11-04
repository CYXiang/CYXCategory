//
//  UITextField+CYXExtension.m
//  CYXBuDeJie
//
//  Created by Macx on 15/10/10.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "UITextField+CYXExtension.h"

static NSString * const CYXPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (CYXExtension)
/**
 *  自定义占位文字颜色
 *
 *  @param placeholderColor 接收颜色
 */


- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    if (placeholderColor == nil) {
        [self setValue:CYXGrayColor(255 * 0.65) forKeyPath:CYXPlaceholderColorKey];
    }else{
        // 保存之前的占位文字
        NSString *placeholder = self.placeholder;
        
        // 保证placeholder被创建
        self.placeholder = @" ";
        [self setValue:placeholderColor forUndefinedKey:CYXPlaceholderColorKey];
        
        // 恢复之前的占位文字
        self.placeholder = placeholder;
    }

}

/**
 *  获得占位文字颜色
 */
- (UIColor *)placeholderColor{
    return [self valueForKeyPath:CYXPlaceholderColorKey];
}

@end
