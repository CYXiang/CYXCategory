//
//  UIBarButtonItem+CYXExtension.h
//  CYXBuDeJie
//
//  Created by Macx on 15/9/29.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CYXExtension)

+ (instancetype)itemWithimageName:(NSString *)image highlightImage:(NSString *)hightImage target:(id)target action:(SEL)action;

@end
