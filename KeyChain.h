//
//  KeyChain.h
//  KeyChain
//
//  Created by 一整天 on 2017/3/24.
//  Copyright © 2017年 一整天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChain : NSObject

+(NSMutableDictionary *)getChainQuery:(NSString *)service;

+(void)save:(NSString *)serivce data:(id)data;

+(id)load:(NSString *)serivce;

+(void)delete:(NSString *)serivce;

@end
