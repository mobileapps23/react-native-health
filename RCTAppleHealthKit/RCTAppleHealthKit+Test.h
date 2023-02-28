//
//  RCTAppleHealthKit+Test.h
//  RCTAppleHealthKit
//
//  Created by Anastasia Mishur on 27.02.23.
//  Copyright © 2023 Greg Wilson. All rights reserved.
//

#import "RCTAppleHealthKit.h"

@class TestSwiftClass;

@interface RCTAppleHealthKit (Test)

- (void)test_returnSomeStringValue:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;

@end

