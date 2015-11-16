//
//  CYXSettingViewController.m
//  CYXClearCacheCell
//
//  Created by Macx on 15/4/19.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "CYXSettingViewController.h"
#import "CYXClearCacheCell.h"

@interface CYXSettingViewController ()

@end

@implementation CYXSettingViewController

static NSString *const CYXClearCellID = @"clear_cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = CYXCommonBgColor;
    
    [self.tableView registerClass:[CYXClearCacheCell class] forCellReuseIdentifier:CYXClearCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CYXOtherCellID];
    
    self.navigationItem.title = @"设置";
}

- (void)getCatchSize{

    
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        CYXClearCacheCell *cell = [tableView dequeueReusableCellWithIdentifier:CYXClearCellID];
        return cell;
    }
    return [tableView dequeueReusableCellWithIdentifier:CYXOtherCellID];
}


@end
