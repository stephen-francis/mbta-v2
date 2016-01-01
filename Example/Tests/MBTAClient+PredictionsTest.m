//
//  MBTAClient+RoutesTest.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/18/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "Constants.h"
#import "MBTAClient.h"
#import "MBTAClient+Predictions.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>


@interface MBTAClient_PredictionsTest : XCTestCase

@end

@implementation MBTAClient_PredictionsTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRetrievePredictionsByRoute
{
    [[MBTAClient shared] retrievePredictionsByRoute:kMBTA_TEST_ROUTE_ID
                                includeAccessAlerts:YES
                               includeServiceAlerts:YES
                                         completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving predictionsByRoute");
         XCTAssert(!error, @"There was an error retrieving predictionsByRoute");
     }];
}

- (void)testRetrievePredictionsByStop
{
    [[MBTAClient shared] retrievePredictionsByStop:kMBTA_TEST_STOP_ID
                               includeAccessAlerts:YES
                              includeServiceAlerts:YES
                                        completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving predictionsByStop");
         XCTAssert(!error, @"There was an error retrieving predictionsByStop");
     }];
}

- (void)testRetrievePredictionsByTrip
{
    [[MBTAClient shared] retrievePredictionsByTrip:kMBTA_TEST_TRIP_ID
                                        completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving predictionsByTrip");
         XCTAssert(!error, @"There was an error retrieving predictionsByTrip");
     }];
}

- (void)testRetrieveVehiclesByRoute
{
    [[MBTAClient shared] retrieveVehiclesByRoute:kMBTA_TEST_ROUTE_ID includeAccessAlerts:YES includeServiceAlerts:YES completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving VehiclesByRoute");
         XCTAssert(!error, @"There was an error retrieving VehiclesByRoute");
     }];
}



- (void)testRetrieveVehiclesByTrip
{
    [[MBTAClient shared] retrieveVehiclesByTrip:kMBTA_TEST_TRIP_ID completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving VehiclesByTrip");
         XCTAssert(!error, @"There was an error retrieving VehiclesByTrip");
     }];
}

@end