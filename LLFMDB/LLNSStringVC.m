//
//  LLNSStringVC.m
//  LLFMDB
//
//  Created by liushaohua on 2017/8/10.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "LLNSStringVC.h"


#define LLNSStringVCTabName @"LLNSStringVCTabName"
#define LLNSStringVCID @"LLNSStringVCID"

@interface LLNSStringVC ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextFiled;

@end

@implementation LLNSStringVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 建表  内部已经处理好 如果已经有此表就不会重复创建
    [[LLKeyValueStore shareStore] createDBWithTableName:LLNSStringVCTabName];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = [[LLKeyValueStore shareStore]getStringById:LLNSStringVCID fromTable:LLNSStringVCTabName];
    
    if (str.length > 0) {
        self.nameTextFiled.text = str;
        [self.view showToastWithText:@"从数据库中取出的数据"];
    }
}


- (IBAction)saveStr:(UIButton *)sender {
    
    if (self.nameTextFiled.text.length <= 0)  return;
    
    // 保存值  指定id 
    [[LLKeyValueStore shareStore] putString:self.nameTextFiled.text withId:LLNSStringVCID intoTable:LLNSStringVCTabName];
    [self.view showToastWithText:@"缓存成功"];
    
}
- (IBAction)deleteStr:(UIButton *)sender {
    
    [[LLKeyValueStore shareStore] deleteObjectById:LLNSStringVCID fromTable:LLNSStringVCTabName];
    [self.view showToastWithText:@"删除缓存成功"];
    
    
}

@end
