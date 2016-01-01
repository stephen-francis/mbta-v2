//
//  MBTAClient+Stops.h
//  MBTAFramework
//
//  Created by Stephen Francis on 12/15/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "MBTAClient.h"

@interface MBTAClient (Stops)

- (NSURLSessionDataTask *)retrieveStopsByRoute:(NSString *)routeID
                                    completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveStopsByLocationWithLat:(NSNumber *)lat lon:(NSNumber *)lon
                                              completion:(MBTAClientCompletion)completion;

@end
