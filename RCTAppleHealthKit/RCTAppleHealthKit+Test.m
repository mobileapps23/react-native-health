//
//  RCTAppleHealthKit+Test.m
//  RCTAppleHealthKit
//
//  Created by Anastasia Mishur on 27.02.23.
//  Copyright © 2023 Greg Wilson. All rights reserved.
//

#import "RCTAppleHealthKit+Test.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+Utils.h"
#import "SwiftInterfaceFiles.h"

#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTLog.h>

@implementation RCTAppleHealthKit (Test)

- (void)test_returnSomeStringValue:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{


    TestSwiftClass *instanceOfTestClass = [TestSwiftClass new];
    NSString *result = [instanceOfTestClass returnValue];


    NSDate *date = [RCTAppleHealthKit dateFromOptions:input key:@"date" withDefault:[NSDate date]];
    NSLog(@"some log info: %@", date);

    NSDictionary *response = @{
            @"value" : @"Some String Value",
            @"valueFromSwift" : @(result),
    };


        callback(@[[NSNull null], response]);

}

@end
