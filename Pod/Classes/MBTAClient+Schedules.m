//
//  MBTAClient+Schedules.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/16/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "MBTAClient+Requests.h"
#import "MBTAClient+Schedules.h"

@implementation MBTAClient (Schedules)

- (NSURLSessionDataTask *)retrieveScheduleByStop:(NSString *)stop
                                           route:(NSString *)route
                                       direction:(NSNumber *)direction
                                        dateTime:(NSNumber *)dateTime
                                         maxTime:(NSNumber *)maxTime
                                        maxTrips:(NSNumber *)maxTrips
                                      completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForScheduleByStop:stop
                                                             route:route
                                                         direction:direction
                                                          dateTime:dateTime
                                                           maxTime:maxTime
                                                          maxTrips:maxTrips]
                         completion:completion];
}



- (NSURLSessionDataTask *)retrieveScheduleByRoute:(NSString *)route
                                                  direction:(NSNumber *)direction
                                                   dateTime:(NSNumber *)dateTime
                                                    maxTime:(NSNumber *)maxTime
                                                   maxTrips:(NSNumber *)maxTrips
                                                 completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForScheduleByRoute:route
                                                          direction:direction
                                                           dateTime:dateTime
                                                            maxTime:maxTime
                                                           maxTrips:maxTrips]
                         completion:completion];
}



- (NSURLSessionDataTask *)retrieveScheduleByTrip:(NSString *)trip
                                                  dateTime:(NSNumber *)dateTime
                                                completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForScheduleByTrip:trip
                                                          dateTime:dateTime]
                         completion:completion];
}

@end
