//
//  UIImageView+CYXExtension.h
//  CYXBuDeJie
//
//  Created by Macx on 15/10/10.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CYXExtension)

/**
 *  用默认的方式设置头像(默认是圆形)
 */
- (void)setHeaderWithURL:(NSString *)url;

/**
 *  设置圆形头像
 */
- (void)setCircleHeaderWithURL:(NSString *)url;

/**
 *  设置方形头像
 */
- (void)setRectHeaderWithURL:(NSString *)url;

@end
