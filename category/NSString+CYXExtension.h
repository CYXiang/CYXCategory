//
//  NSString+CYXExtension.h
//  CYXBuDeJie
//
//  Created by Macx on 15/10/13.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CYXExtension)

/**
 *  根据一个字符串路径，获得这个路径的文件大小
 */
- (unsigned long long)fileSize;

@end
