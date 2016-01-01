//
//  MBTAClientTests.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/18/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "Constants.h"
#import "MBTAClient.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface MBTAClientTests : XCTestCase
@end

static MBTAClient *_sharedMBTAClient = nil;

@implementation MBTAClientTests

- (void)setUp
{
    [super setUp];
    _sharedMBTAClient = [MBTAClient shared];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample
{
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testInstantiation
{
    XCTAssert(_sharedMBTAClient, @"Couldn't get shared client");
}

@end

/*
 

 

[[MBTAClient shared] retrieveStopsByRoute:kMBTA_TEST_ROUTE completion:^(NSData *data, NSError *error)
 {
     NSDictionary *stopsJSON = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingAllowFragments
                                error:nil];
     NSLog(@"\nSTOPS_BY_ROUTE:\n%@", stopsJSON);
     
     //NSArray *routes = [routesJSON objectForKey:@"mode"];
     
     NSArray *stops = [MBTAConverter convertStopsByRoute:stopsJSON];
     NSLog(@"%lu", (unsigned long)[stops count]);
     for (MBTAStop *stop in stops)
     {
         //NSLog(@"%@", stop.stopName);
         NSLog(@"%@", stop.routeInfo.directionName);
         NSLog(@"%@", stop.routeInfo.directionID);
         NSLog(@"%@", stop.routeInfo.stopOrder);
     }
 }];



 [MBTAClient retrieveStopsByLocationWithLat:lat lon:lon completion:^(NSData *data, NSError *error)
 {
 NSDictionary *stopsJSON = [NSJSONSerialization
 JSONObjectWithData:data
 options:NSJSONReadingAllowFragments
 error:nil];
 NSLog(@"\nSTOPS_BY_LOC\n%@", stopsJSON);
 
 NSArray *stops = [MBTAConverter convertStopsByLocation:stopsJSON];
 NSLog(@"%lu", (unsigned long)[stops count]);
 for (MBTAStop *stop in stops)
 NSLog(@"%@", stop.distance);
 
 }];
 */

/*

 //
 //  GTFHManagerTest.m
 //  GettingThereFromHere
 //
 //  Created by Stephen Francis on 4/25/14.
 //  Copyright (c) 2014 SFra. All rights reserved.
 //
 
 #import "Constants.h"
 #import "MBTAManager.h"
 #import <XCTest/XCTest.h>
 
 @interface GTFHManagerTest : XCTestCase <MBTAManagerDelegate>
 @property (nonatomic, assign) bool done;
 @property (nonatomic, strong) NSError *error;
 @property (nonatomic, strong) MBTAManager *manager;
 
 
 
 @property (nonatomic, strong) NSArray *routes;
 @property (nonatomic, strong) NSArray *stops;
 @property (nonatomic, strong) NSDictionary *stopsForRoute;
 @end
 
 @implementation GTFHManagerTest
 @synthesize done = _done;
 @synthesize  error = _error;
 @synthesize manager = _manager;
 @synthesize routes = _routes;
 @synthesize  stops = _stops;
 @synthesize stopsForRoute = _stopsForRoute;
 
 - (void)setUp
 {
 [super setUp];
 self.manager = [[MBTAManager alloc] init];
 self.manager.communicator.delegate = self.manager;
 self.manager.delegate = self;
 
 self.done = NO;
 self.error = nil;
 }
 
 - (void)tearDown
 {
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 [super tearDown];
 }
 
 - (void)testRetrieveStopsByLocationWithLatLon
 {
 [self.manager retrieveStopsByLocationWith:BRAINTREE_LAT andLon:BRAINTREE_LON];
 
 XCTAssertTrue([self waitForCompletion:90.0], @"Failed to get any results in time");
 XCTAssertNotNil(self.stops, @"Expected results");
 MBTAStop *firstResult = [self.stops objectAtIndex:0];
 XCTAssertNotNil(firstResult, @"Expected at least one result");
 XCTAssertEqualObjects(firstResult.name, @"Braintree", @"Unexpected stop name");
 XCTAssertEqual(firstResult.order, 0, @"Unexpected order found");
 self.done = NO;
 }
 
 - (void)testRetrieveRoutesForStop
 {
 MBTAStop *braintree = [[MBTAStop alloc] init];
 braintree.name = @"Braintree";
 braintree.lat = BRAINTREE_LAT;
 braintree.lon = BRAINTREE_LON;
 braintree.stopID = @"Braintree";
 braintree.parentStationName = @"Braintree Station";
 braintree.parentStation = @"place-brntn";
 braintree.distance = 0;
 
 [self.manager retrieveRoutesAccessibleByStop:braintree];
 
 XCTAssertTrue([self waitForCompletion:90.0], @"Failed to get any results in time");
 XCTAssertNotNil(self.routes, @"Expected results");
 MBTARoute *firstResult = [self.routes objectAtIndex:0];
 XCTAssertNotNil(firstResult, @"Expected at least one result");
 XCTAssertEqualObjects(firstResult.routeID, @"CR-Kingston", @"Unexpected routeID");
 XCTAssertEqualObjects(firstResult.routeName, @"Kingston/Plymouth Line", @"Unexpected routeName");
 XCTAssertEqual(firstResult.routeType, 2, @"Unexpected routeType");
 self.done = NO;
 }
 
 - (void)testRetrieveStopsForRoute
 {
 MBTARoute *route = [[MBTARoute alloc] init];
 route.routeID = @"931_";
 [self.manager retrieveStopsOnRoute:route];
 XCTAssertTrue([self waitForCompletion:90.0], @"Failed to get any results in time");
 XCTAssertNotNil([self.stopsForRoute objectForKey:@"Southbound"], @"Expected Southbound direction route");
 self.done = NO;
 }
 
 - (void)testFailingError
 {
 MBTARoute *invalidRoute = [[MBTARoute alloc] init];
 invalidRoute.routeID = @"yabadabado";
 [self.manager retrieveStopsOnRoute:invalidRoute];
 
 XCTAssertTrue([self waitForCompletion:90.0], @"Failed to get any results in time");
 XCTAssertNotNil(self.error, @"Expected error to be retrieved");
 self.done = NO;
 }
 
 // wait for 90 seconds or for delegate to flag success
 - (BOOL)waitForCompletion:(NSTimeInterval)timeoutSecs
 {
 NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutSecs];
 
 do
 {
 [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate];
 if([timeoutDate timeIntervalSinceNow] < 0.0)
 break;
 } while (!self.done);
 
 return self.done;
 }
 
 #pragma mark MBTAManagerDelegate
 - (void)didRetrieveNearestStops:(NSArray *)nearestStops
 {
 self.done = YES;
 self.stops = nearestStops;
 }
 
 - (void)didRetrieveRoutesForStop:(NSArray *)stopRoutes
 {
 self.done = YES;
 self.routes = stopRoutes;
 }
 
 - (void)didRetrieveStopsForRoute:(NSDictionary *)stopsForRoute
 {
 self.done = YES;
 self.stopsForRoute = stopsForRoute;
 }
 
 - (void)fetchingTransitJSONFailedWithError:(NSError *)error
 {
 self.done = YES;
 self.error = error;
 }
 @end



*/