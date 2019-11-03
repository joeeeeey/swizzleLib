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


// 调用类方法 load, 而该文件会以动态库的方式运行整个程序，所以在此处替换想要替换的方法
@implementation NSObject (CrackLib)
+ (void)load
{
    Class class = objc_getClass("ZTrialPeriod");
    [class jr_swizzleMethod:@selector(setIsTrialPeriodValid) withMethod:@selector(crack_setIsTrialPeriodValid) error:nil];
    [class jr_swizzleMethod:@selector(hasExpired) withMethod:@selector(crack_hasExpired) error:nil];
    [class jr_swizzleMethod:@selector(remaining) withMethod:@selector(crack_remaining) error:nil];
    
//    [class jr_swizzleMethod:@selector(isTrialPeriodValid) withMethod:@selector(crack_isTrialPeriodValid) error:nil];

//    [class jr_swizzleMethod:@selector(duration) withMethod:@selector(crack_duration) error:nil];
//    
//    [class jr_swizzleMethod:@selector(elapsed) withMethod:@selector(crack_elapsed) error:nil];
}


//- (BOOL)crack_showExpiryWindow {
//    NSLog(@"crack_showExpiryWindow");
//    return YES;
//}

- (unsigned long long) crack_duration
{
    return 10;
}

-  (unsigned long long) crack_elapsed {
    return 11;
}


- (BOOL)crack_hasExpired
{
    return NO;
}

- (unsigned long long)crack_remaining
{
    NSLog(@"crack_remaining");
    return 36500000000000000;
}

- (void)crack_setIsTrialPeriodValid
{
     NSLog(@"setIsTrialPeriodValid");
}

- (BOOL)crack_isTrialPeriodValid
{
    NSLog(@"crack_isTrialPeriodValid nonono");
    //    printf("%ld\n", (long)[self duration]);
    //    NSLog([self duration]);
    return NO;
}

@end
