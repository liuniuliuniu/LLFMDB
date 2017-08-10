//
//  LLNSNumberVC.m
//  LLFMDB
//
//  Created by liushaohua on 2017/8/10.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "LLNSNumberVC.h"

#define LLNSNumberVCTabName @"LLNSNumberVCTabName"
#define LLNSNumberVCID @"LLNSNumberVCID"

@interface LLNSNumberVC ()

@property (weak, nonatomic) IBOutlet UITextField *numberTextFiled;

@end

@implementation LLNSNumberVC


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[LLKeyValueStore shareStore] createDBWithTableName:LLNSNumberVCTabName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *number = [[LLKeyValueStore shareStore]getNumberById:LLNSNumberVCID fromTable:LLNSNumberVCTabName];
    
    if (number != nil) {
        self.numberTextFiled.text = [number stringValue];
    }    
}

- (IBAction)saveInfo:(id)sender {
    
    [[LLKeyValueStore shareStore]putNumber:[NSNumber numberWithDouble:[self.numberTextFiled.text doubleValue]] withId:LLNSNumberVCID intoTable:LLNSNumberVCTabName];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
