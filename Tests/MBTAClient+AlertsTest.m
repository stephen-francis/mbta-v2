//
//  MBTAClient+AlertsTest.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/18/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "Constants.h"
#import "MBTAClient.h"
#import "MBTAClient+Alerts.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface MBTAClient_AlertsTest : XCTestCase

@end

@implementation MBTAClient_AlertsTest

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

- (void)testRetrieveAlertHeadersByRoute
{
    [[MBTAClient shared] retrieveAlertHeadersByRoute:kMBTA_TEST_ROUTE_ID includeAccessAlerts:YES includeServiceAlerts:YES completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving alertHeadersByRoute");
         XCTAssert(!error, @"There was an error retrieving alertHeadersByRoute");
     }];
}

- (void)testRetrieveAlertHeadersByStop
{
    [[MBTAClient shared] retrieveAlertHeadersByStop:kMBTA_TEST_STOP_ID includeAccessAlerts:YES includeServiceAlerts:YES completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving alertHeadersByStop");
         XCTAssert(!error, @"There was an error retrieving alertHeadersByStop");
     }];
    
}

- (void)testRetrieveAlertHeadersToIncludeAccessAlerts
{
    [[MBTAClient shared] retrieveAlertHeadersToIncludeAccessAlerts:YES includeServiceAlerts:YES completion:
     ^(NSData *data, NSError *error)
     {
        XCTAssert(data, @"No data from retrieving alertHeadersToIncludeAccessAlerts");
         XCTAssert(!error, @"There was an error retrieving alertHeadersToIncludeAccessAlerts");
     }];
    
}

- (void)testRetrieveAlertByID
{
    [[MBTAClient shared] retrieveAlertByID:kMBTA_TEST_ALERT_ID includeAccessAlerts:YES includeServiceAlerts:YES completion:
     ^(NSData *data, NSError *error)
     {
        XCTAssert(data, @"No data from retrieving alertByID");
         XCTAssert(!error, @"There was an error retrieving alertByID");
     }];
    
}

- (void)testRetrieveAlertsByRoute
{
    [[MBTAClient shared] retrieveAlertsByRoute:kMBTA_TEST_ROUTE_ID includeAccessAlerts:YES includeServiceAlerts:YES completion:
     ^(NSData *data, NSError *error)
     {
        XCTAssert(data, @"No data from retrieving alertsByRoute");
         XCTAssert(!error, @"There was an error retrieving alertsByRoute");
     }];
    
}

- (void)testRetrieveAlertsByStop
{
    [[MBTAClient shared] retrieveAlertsByStop:kMBTA_TEST_STOP_ID includeAccessAlerts:YES includeServiceAlerts:YES completion:
     ^(NSData *data, NSError *error)
     {
        XCTAssert(data, @"No data from retrieving alertsByStop");
         XCTAssert(!error, @"There was an error retrieving alertsByStop");
     }];
    
}

- (void)testRetrieveAlertsToIncludeAccessAlerts
{
    [[MBTAClient shared] retrieveAlertsToIncludeAccessAlerts:YES includeServiceAlerts:YES completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving alertsToIncludeAccessAlerts");
         XCTAssert(!error, @"There was an error retrieving alertsToIncludeAccessAlerts");
     }];
    
}

- (void)testRetrieveServerTime
{
    [[MBTAClient shared] retrieveServerTimeWithCompletion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving serverTime");
         XCTAssert(!error, @"There was an error retrieving serverTime");
     }];
    
}

@end
