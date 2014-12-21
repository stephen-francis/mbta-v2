//
//  MBTAClient+Predictions.h
//  MBTAFramework
//
//  Created by Stephen Francis on 12/16/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "MBTAClient.h"

@interface MBTAClient (Predictions)

- (NSURLSessionDataTask *)retrievePredictionsByStop:(NSString *)stop
                   includeAccessAlerts:(bool)includeAccessAlerts
                  includeServiceAlerts:(bool)includeServiceAlerts
                                         completion:(MBTAClientCompletion)completion;


- (NSURLSessionDataTask *)retrievePredictionsByRoute:(NSString *)route
                    includeAccessAlerts:(bool)includeAccessAlerts
                   includeServiceAlerts:(bool)includeServiceAlerts
completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveVehiclesByRoute:(NSString *)route
                              includeAccessAlerts:(bool)includeAccessAlerts
                             includeServiceAlerts:(bool)includeServiceAlerts
                                       completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrievePredictionsByTrip:(NSString *)trip
completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveVehiclesByTrip:(NSString *)trip
completion:(MBTAClientCompletion)completion;
@end
