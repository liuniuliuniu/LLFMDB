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
    
    // 有数据就直接赋值
    self.nameTextFiled.text = [[LLKeyValueStore shareStore]getStringById:LLNSStringVCID fromTable:LLNSStringVCTabName];
    
}

- (IBAction)saveStr:(UIButton *)sender {
    
    if (self.nameTextFiled.text.length <= 0) return;
    
    // 保存值  指定id
    [[LLKeyValueStore shareStore] putString:self.nameTextFiled.text withId:LLNSStringVCID intoTable:LLNSStringVCTabName];
    
}

@end
