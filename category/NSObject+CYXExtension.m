//
//  NSObject+CYXExtension.m
//  CYXBuDeJie
//
//  Created by Macx on 15/10/10.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "NSObject+CYXExtension.h"
#import <objc/runtime.h>

@implementation NSObject (CYXExtension)

/**
 *  通过运行时获取
 */
+ (void)logAllIvars{
    // 谁调用这个类方法就传谁
    Class c = self;
    
    while (c) {
        // 获得所有的成员变量
        unsigned int outCount = 0;
    
        Ivar *ivarList = class_copyIvarList(c, &outCount);
        
        // 遍历所有的成员变量
        for (int i = 0; i < outCount; i++) {
            // 获取第i个成员变量
            Ivar ivar = ivarList[i];
        
            // 获得成员变量的名称和类型
            CYXLog(@"%@ -> %s %s",c,ivar_getName(ivar),ivar_getTypeEncoding(ivar));
        }
    
        // 释放资源
        free(ivarList);
        
        // 获取父类
        c = class_getSuperclass(c);
    }

}


@end
