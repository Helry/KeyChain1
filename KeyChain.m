//
//  KeyChain.m
//  KeyChain
//
//  Created by 一整天 on 2017/3/24.
//  Copyright © 2017年 一整天. All rights reserved.
//

#import "KeyChain.h"

@implementation KeyChain


+(NSMutableDictionary *)getChainQuery:(NSString *)service{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:(id)kSecClassGenericPassword,(id)kSecClass,service,(id)kSecAttrService,service,(id)kSecAttrAccount,(id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,nil];
}
//XIERU 写入
+(void)save:(NSString *)serivce data:(id)data{
    NSMutableDictionary *keyChainQuery = [self getChainQuery:serivce];
    SecItemDelete((CFDictionaryRef)keyChainQuery);
    [keyChainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    SecItemAdd((CFDictionaryRef)keyChainQuery, NULL);
}

+(id)load:(NSString *)serivce{
    id ret = nil;
    NSMutableDictionary *keyChainQuery = [self getChainQuery:serivce];
    [keyChainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keyChainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keyChainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *exception) {
            NSLog(@"");
        } @finally {
            
        }
    }
    if (keyData) {
        CFRelease(keyData);
        return ret;
    }
    
}
+(void)delete:(NSString *)serivce{
    NSMutableDictionary *keyChainQuery = [self getChainQuery:serivce];
    SecItemDelete((CFDictionaryRef)keyChainQuery);
}
@end
