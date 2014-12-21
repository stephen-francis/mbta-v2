//
//  MBTAClient+RoutesTest.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/18/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "Constants.h"
#import "MBTAClient.h"
#import "MBTAClient+Stops.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface MBTAClient_StopsTest : XCTestCase

@end

@implementation MBTAClient_StopsTest

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


- (void)testRetrieveStopsByLocationWithLat
{
    NSNumber *lat = [NSNumber numberWithFloat:kMBTA_TEST_LAT];
    NSNumber *lon = [NSNumber numberWithFloat:kMBTA_TEST_LON];
    
    [[MBTAClient shared] retrieveStopsByLocationWithLat:lat lon:lon completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(!error, @"There was an error retrieving stopsByLocationWithLat");
     }];
}

- (void)testRetrieveStopsByRoute
{
    [[MBTAClient shared] retrieveStopsByRoute:kMBTA_TEST_ROUTE_ID completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(!error, @"There was an error retrieving stopsByRoute");
     }];
    
}



@end

