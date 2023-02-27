//
//  RCTAppleHealthKit+Test.h
//  RCTAppleHealthKit
//
//  Created by Anastasia Mishur on 27.02.23.
//  Copyright © 2023 Greg Wilson. All rights reserved.
//

#import "RCTAppleHealthKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCTAppleHealthKit (Test)

- (void)test_returnSomeStringValue:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;

@end

NS_ASSUME_NONNULL_END
