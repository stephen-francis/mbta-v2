//
//  MBTAClient+RoutesTest.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/18/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "Constants.h"
#import "MBTAClient.h"
#import "MBTAClient+Routes.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface MBTAClient_RoutesTest : XCTestCase

@end

@implementation MBTAClient_RoutesTest

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

- (void)testRetrieveRoutes
{
    [[MBTAClient shared] retrieveRoutesWithCompletion:^(NSData *data, NSError *error)
     {
         XCTAssert(!error, @"There was an error retrieving routes");
     }];
}

- (void)testRetrieveRoutesByStop
{
    [[MBTAClient shared] retrieveRoutesByStop:kMBTA_TEST_STOP_ID withCompletion:^(NSData *data, NSError *error)
     {
         XCTAssert(!error, @"There was an error retrieving routesByStop");
     }];

}


@end
