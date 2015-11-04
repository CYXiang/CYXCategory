//
//  UIImageView+CYXExtension.m
//  CYXBuDeJie
//
//  Created by Macx on 15/10/10.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "UIImageView+CYXExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (CYXExtension)


- (void)setHeaderWithURL:(NSString *)url{
    
    // 默认是圆形的
    [self setCircleHeaderWithURL:url];

}

/**
 *  经过圆形处理的图片
 */
- (void)setCircleHeaderWithURL:(NSString *)url{

    UIImage *placeholderImage = [UIImage circleImageNamed:@"defaultUserIcon"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 下载失败，不做任何处理，直接显示占位图片
        if (image == nil) {
            return;
        }
        // 把图片截成圆形
        self.image = [image circleImage];
    }];


}

/**
 *  不进行圆形处理
 */
- (void)setRectHeaderWithURL:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString: url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];

}

@end
