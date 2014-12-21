//
//  MBTAClient+RoutesTest.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/18/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "Constants.h"
#import "MBTAClient.h"
#import "MBTAClient+Schedules.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface MBTAClient_SchedulesTest : XCTestCase

@end

@implementation MBTAClient_SchedulesTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRetrieveSchedulesByRoute
{
    [[MBTAClient shared] retrieveScheduleByRoute:kMBTA_TEST_ROUTE_ID direction:nil dateTime:nil maxTime:nil maxTrips:nil completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving predictionsByRoute");
         XCTAssert(!error, @"There was an error retrieving predictionsByRoute");
     }];
}

- (void)testRetrieveSchedulesByStop
{
    [[MBTAClient shared] retrieveScheduleByStop:kMBTA_TEST_ROUTE_ID route:nil direction:nil dateTime:nil maxTime:nil maxTrips:nil completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving ScheduleByStop");
         XCTAssert(!error, @"There was an error retrieving ScheduleByStop");
     }];
}



- (void)testRetrieveSchedulesByTrip
{
    [[MBTAClient shared] retrieveScheduleByTrip:kMBTA_TEST_TRIP_ID dateTime:nil completion:
     ^(NSData *data, NSError *error)
     {
         XCTAssert(data, @"No data from retrieving SchedulesByTrip");
         XCTAssert(!error, @"There was an error retrieving SchedulesByTrip");
     }];
}

@end


/*
 - (NSURLSessionDataTask *)retrieveScheduleByStop:(NSString *)stop
 route:(NSString *)route
 direction:(NSNumber *)direction
 dateTime:(NSNumber *)dateTime
 maxTime:(NSNumber *)maxTime
 maxTrips:(NSNumber *)maxTrips
 completion:(MBTAClientCompletion)completion;
 
 - (NSURLSessionDataTask *)retrieveScheduleByRoute:(NSString *)route
 direction:(NSNumber *)direction
 dateTime:(NSNumber *)dateTime
 maxTime:(NSNumber *)maxTime
 maxTrips:(NSNumber *)maxTrips
 completion:(MBTAClientCompletion)completion;
 
 - (NSURLSessionDataTask *)retrieveScheduleByTrip:(NSString *)trip
 dateTime:(NSNumber *)dateTime
 completion:(MBTAClientCompletion)completion;
 
 
 
 
 
 
 * SCHEDULEBYROUTE
 * This query will return the scheduled arrivals and departures in a direction for a particular route.
 * Special Parameters:
 *
 * route 	GTFS-compatible route_id value for which schedule should be returned
 * Data type: String
 * Example: “CR-Providence”
 
 * direction (optional) 	GTFS-compatible direction_id value on route for which schedule should be
 * returned
 * If not included then schedule for all directions of the route will be returned
 * Data type: Bit (0 or 1)
 * Example: “0”
 
 * datetime (optional) 		Epoch time after which schedule should be returned
 * If included then must be within the next seven (7) days
 * If not included then schedule starting from the current datetime will be returned
 * Data type: Integer
 * Example: “1361989200”
 
 * max_time (optional) 		Defines maximum range of time (in minutes) within which trips will be returned.
 * Integer between 1 and 1440 (24 hours).
 * If not included defaults to 60.
 * Example: “120”
 
 * max_trips (optional) 	Defines number of trips to return. Integer between 1 and 100.
 * If not included defaults to 5.
 * Example: “100”
 *
 *
 * Example
 * http://realtime.mbta.com/developer/api/v2/schedulebyroute?api_key=wX9NwuHnZU2ToO7GmGR9uw&route=CR-Providence&direction=0&format=json
 */