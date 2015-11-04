//
//  NSString+CYXExtension.m
//  CYXBuDeJie
//
//  Created by Macx on 15/10/13.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "NSString+CYXExtension.h"

@implementation NSString (CYXExtension)

- (unsigned long long)fileSize{

    // 获得文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 标记是否为文件夹
    BOOL isDirectory = NO;
    
    // 首先判断路径是否存在
    BOOL exisit = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    
    // 路径不存在是马上返回
    if (!exisit) return 0;
    
    // 如果是文件夹
    if (isDirectory) {
        // 文件总大小
        unsigned long long fileSize = 0;
        // 遍历所有文件
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 拼接完整路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 累加文件夹下所有文件
            fileSize += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
        return fileSize;
    }
    
    // 如果是文件
    return [mgr attributesOfItemAtPath:self error:nil].fileSize;
    
}


@end
