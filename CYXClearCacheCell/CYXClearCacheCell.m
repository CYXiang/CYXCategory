//
//  CYXClearCacheCell.m
//  CYXClearCacheCell
//
//  Created by Macx on 15/4/19.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "CYXClearCacheCell.h"
#import <SVProgressHUD.h>

@implementation CYXClearCacheCell

#define CYXCacheFilePath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"default"]


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.text = @"清除缓存";
        
        // 开启异步线程计算缓存大小（耗时操作一般放在异步子线程）
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
            // 计算缓存的大小
            // 单位
            double unit = 1000.0;
            unsigned long long fileSize = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject] stringByAppendingPathComponent:@"default"].fileSize;
//            unsigned long long fileSize = @"/Users/Macx/Desktop/本地课堂共享".fileSize;
            NSString *fileSizeText = nil;
            if (fileSize >= pow(unit, 3)) { // fileSize >= 1GB
                fileSizeText = [NSString stringWithFormat:@"%.2fGB", fileSize / pow(unit, 3)];
            } else if (fileSize >= pow(unit, 2)) { // fileSize >= 1MB
                fileSizeText = [NSString stringWithFormat:@"%.2fMB", fileSize / pow(unit, 2)];
            } else if (fileSize >= unit) { // fileSize >= 1KB
                fileSizeText = [NSString stringWithFormat:@"%.2fKB", fileSize / unit];
            } else { // fileSize < 1KB
                fileSizeText = [NSString stringWithFormat:@"%zdB", fileSize];
            }
            
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)", fileSizeText];
            
            // 回到主线程更新UI
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                self.textLabel.text = text;

                self.accessoryView = nil;
                
                self.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
            }];

        }];
        
        // 添加手势监听器
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearCache)]];
    }
    
    return self;
    
}

- (void)clearCache{

    // 弹框
    [SVProgressHUD showWithStatus:@"正在清除缓存..." maskType:SVProgressHUDMaskTypeBlack];
    
    // 在子线程进行删除操作
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        // 删除缓存文件夹
        [[NSFileManager defaultManager] removeItemAtPath:CYXCacheFilePath error:nil];
        
        // 在主线程执行其他操作
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // 隐藏弹框
            [SVProgressHUD dismiss];
            
            // 修改文字
            self.textLabel.text = @"清除缓存(0B)";
        }];
    }];
    
}

@end
