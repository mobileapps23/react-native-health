#import "RCTAppleHealthKit+Methods_ReproductiveStatistics.h"
#import "RCTAppleHealthKit+TypesForReproductiveStatistics.h"
#import "RCTAppleHealthKit+TypesForMedianStatistic.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+Utils.h"

#import <React/RCTLog.h>

@implementation RCTAppleHealthKit (Methods_ReproductiveStatistics)

// MARK: - Public

- (void)statistics_getReproductiveStatistic: (RCTResponseSenderBlock)callback {

    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:0];
    NSDate *endDate = [NSDate date];

    NSMutableArray *output = [NSMutableArray new];

    // prepare object for all of reproductive categories identifiers
    NSArray<__kindof NSString *> *reproductiveTypes = [self getReproductiveTypes];
    NSArray<__kindof NSString *> *symptomTypes = [self getSymptomTypes];

    NSMutableArray<__kindof NSString *> *types = [NSMutableArray new];
    [types addObjectsFromArray: reproductiveTypes];
    [types addObjectsFromArray: symptomTypes];
    
    NSMutableDictionary *validSamples = [NSMutableDictionary new];
    for(NSString *sampleName in types) {
        HKSampleType *sampleValue =(HKSampleType *)[self getObjectFromText:sampleName];

        if ([sampleValue isKindOfClass:[HKCharacteristicType class]]) {
            NSLog(@"RNHealth: Could not load data for HKCharacteristicType: %@", sampleName);
            continue;
        }

        if (sampleValue != nil) {
            validSamples[sampleName] = sampleValue;
        } else {
            NSLog(@"RNHealth: Could not load data for type: %@", sampleName);
            continue;
        }
    }

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 10;

    NSOperation *doneOperation = [[NSOperation alloc] init];
    [doneOperation setCompletionBlock:^{
        // NSLog(@"RNHealth getReproductiveStatistic output: %@", output);
        callback(@[[NSNull null], output]);
        return;
    }];

    for(NSString *sampleName in [validSamples allKeys]) {

        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{

            HKSampleType *sample = validSamples[sampleName];

            int limit = 5000;
            __block HKQueryAnchor *anchor = nil;
            __block NSMutableArray<__kindof HKSample *> *resultArray = [NSMutableArray new];
            __block BOOL hasResults = YES;
            __block NSString *anchorString = nil;

            while (hasResults) {
                if (anchorString != nil) {
                    NSData* anchorData = [[NSData alloc] initWithBase64EncodedString:anchorString options:0];
                    anchor = [NSKeyedUnarchiver unarchiveObjectWithData:anchorData];
                }

                NSPredicate *predicate = [RCTAppleHealthKit predicateForAnchoredQueries:anchor startDate:startDate endDate:endDate];

                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

                [self fetchBatchOfSamples:sample
                                predicate:predicate
                                   anchor:anchor
                                    limit:limit
                               completion:^(NSDictionary *results, NSError *error) {

                    if (results) {
                        @try {

                            NSMutableArray<__kindof HKSample *> *data = results[@"data"];

                            if (data == nil) {
                                hasResults = NO;
                                NSLog(@"RNHealth getReproductiveStatistic: An error occured");
                                dispatch_semaphore_signal(semaphore);
                            }

                            if (data.count > 0) {
                                [resultArray addObjectsFromArray:data];

                                //re-assign anchor
                                anchorString = results[@"anchor"];

                            } else {
                                hasResults = NO;
                            }
                            dispatch_semaphore_signal(semaphore);
                        } @catch (NSException *exception) {
                            hasResults = NO;
                            NSLog(@"RNHealth getReproductiveStatistic: An error occured");
                            dispatch_semaphore_signal(semaphore);
                        }
                    } else {
                        hasResults = NO;
                        NSLog(@"RNHealthgetReproductiveStatistic: An error occured");
                        dispatch_semaphore_signal(semaphore);
                    }
                }];

                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            };

            NSMutableDictionary *response = [NSMutableDictionary dictionary];
            response[@"parameterName"] = sampleName ? sampleName : @"";


            NSMutableArray *parameterData = [NSMutableArray new];
            for (HKSample *sample in resultArray) {
                NSMutableDictionary *sampleData = [NSMutableDictionary dictionary];
                sampleData[@"id"] = sample.UUID ? sample.UUID : @"";
                sampleData[@"startDate"] = sample.startDate ? sample.startDate : @"";
                sampleData[@"endDate"] = sample.endDate ? sample.endDate : @"";
                sampleData[@"metadata"] = sample.metadata ? sample.metadata : @"";
                [parameterData addObject: sampleData];
            }
            response[@"parameterData"] = parameterData.count != 0 ? parameterData : [NSArray new];

            [output addObject:response];

        }];
        [queue addOperation:operation];
        [doneOperation addDependency:operation];
    }

    [queue addOperation:doneOperation];

}

@end
