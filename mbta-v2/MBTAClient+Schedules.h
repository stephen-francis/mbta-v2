//
//  MBTAClient+Schedules.h
//  MBTAFramework
//
//  Created by Stephen Francis on 12/16/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBTAClient.h"

@interface MBTAClient (Schedules)

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
@end
