//
//  CrackLib.m
//  CrackLib
//
//  Created by Jun on 2019/11/3.
//  Copyright © 2019 Jun. All rights reserved.
//

#import "CrackLib.h"
#import "JRSwizzle.h"
#import <objc/runtime.h>


@implementation NSObject (CrackLib)
+ (void)load
{
    Class class = objc_getClass("ZTrialPeriod");
    [class jr_swizzleMethod:@selector(stub) withMethod:@selector(crack_stub_1) error:nil];
}


- (unsigned long long) crack_stub_1
{
    NSLog(@"crack_stub_1!!");
    return 123;
}


- (BOOL)crack_stub_2
{
    NSLog(@"crack_stub_2!!");
    return NO;
}


@end
