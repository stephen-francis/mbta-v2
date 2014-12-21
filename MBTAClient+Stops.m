//
//  MBTAClient+Stops.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/15/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "MBTAClient+Requests.h"
#import "MBTAClient+Stops.h"

@implementation MBTAClient (Stops)

- (NSURLSessionDataTask *)retrieveStopsByRoute:(NSString *)routeID
                                    completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForStopsByRoute:routeID]
                         completion:completion];
}

- (NSURLSessionDataTask *)retrieveStopsByLocationWithLat:(NSNumber *)lat lon:(NSNumber *)lon
                                              completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForStopsByLocationWithLat:lat withLon:lon]
                            completion:completion];
}


@end
