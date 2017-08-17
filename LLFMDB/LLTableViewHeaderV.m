//
//  LLTableViewHeaderV.m
//  LLFMDB
//
//  Created by liushaohua on 2017/8/12.
//  Copyright © 2017年 liushaohua. All rights reserved.
//  Git地址 : https://github.com/liuniuliuniu/LLFMDB.git 

#import "LLTableViewHeaderV.h"

@implementation LLTableViewHeaderV

- (instancetype)init{
    
    UINib *nib = [UINib nibWithNibName:@"LLTableViewHeaderV" bundle:nil];
    LLTableViewHeaderV *headerView = [[nib instantiateWithOwner:nil options:nil] firstObject];
    return headerView;
}


@end
