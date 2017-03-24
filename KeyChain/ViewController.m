//
//  ViewController.m
//  KeyChain
//
//  Created by 一整天 on 2017/3/24.
//  Copyright © 2017年 一整天. All rights reserved.
//

#import "ViewController.h"
#import "KeyChain.h"
@interface ViewController ()

@end

NSString *const userName = @"1768183999219950716";
NSString *const username = @"17681839992";
NSString *const password = @"19950716";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary *userNamePassword = [NSMutableDictionary dictionary];
    [userNamePassword setObject:@"userName" forKey:username];
    [userNamePassword setObject:@"password" forKey:password];
    NSLog(@"%@",userNamePassword);
    
    [KeyChain save:userName data:userNamePassword];
    NSMutableDictionary *readUserName = (NSMutableDictionary *)[KeyChain load:userName];
    
    NSString *userName = [readUserName objectForKey:username];
    NSString *passWord = [readUserName objectForKey:password];
    NSLog(@"%@  %@",userName,passWord);
    
    [KeyChain delete:userName];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
