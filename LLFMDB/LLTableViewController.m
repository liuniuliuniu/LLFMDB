//
//  LLTableViewController.m
//  LLFMDB
//
//  Created by liushaohua on 2017/8/11.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "LLTableViewController.h"
#import "LLTableViewHeaderV.h"


#define LLTableViewControllerTabName @"LLTableViewControllerTabName"
#define LLTableViewControllerTabID @"LLTableViewControllerTabID"

@interface LLTableViewController ()

@property(nonatomic, strong)NSArray *dataArr;

@end

@implementation LLTableViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[LLKeyValueStore shareStore] createDBWithTableName:LLTableViewControllerTabName];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLTableViewHeaderV *headerView = [LLTableViewHeaderV new];
    [headerView.loadDataBtn addTarget:self action:@selector(loadData) forControlEvents:UIControlEventTouchUpInside];
    [headerView.saveDataBtn addTarget:self action:@selector(saveData) forControlEvents:UIControlEventTouchUpInside];
    [headerView.deleteDataBtn addTarget:self action:@selector(deleteData) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView.tableHeaderView = headerView;
    
    
    self.dataArr = [[LLKeyValueStore shareStore]getObjectById:LLTableViewControllerTabID fromTable:LLTableViewControllerTabName];
    
    if (self.dataArr.count > 0) {
        [self.view showToastWithText:@"数据库中加载的数据"];
        [self.tableView reloadData];
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}


- (void)loadData{
    
    self.dataArr =  @[
                      @"奥卡姆剃须刀一号",
                      @"奥卡姆剃须刀二号",
                      @"奥卡姆剃须刀三号",
                      @"奥卡姆剃须刀四号",
                      @"奥卡姆剃须刀五号",
                      @"奥卡姆剃须刀六号",
                      @"奥卡姆剃须刀七号",
                      @"奥卡姆剃须刀八号",
                      @"奥卡姆剃须刀九号",
                      @"奥卡姆剃须刀十号",
                      ];
    
    [self.view showToastWithText:@"网络加载出来的数据"];
    [self.tableView reloadData];
}

- (void)saveData{
    
    if (self.dataArr.count < 1) {
        [self.view showToastWithText:@"缓存的数据不能为空"];
        return;
    }
    
    [[LLKeyValueStore shareStore]putObject:self.dataArr withId:LLTableViewControllerTabID intoTable:LLTableViewControllerTabName];
    [self.view showToastWithText:@"缓存数据成功"];
    
}

- (void)deleteData{
    
    [[LLKeyValueStore shareStore]deleteObjectById:LLTableViewControllerTabID fromTable:LLTableViewControllerTabName];
    [self.view showToastWithText:@"删除缓存数据成功"];
    [self.tableView reloadData];

}




@end
