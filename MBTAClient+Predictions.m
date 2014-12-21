//
//  MBTAClient+Predictions.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/16/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "MBTAClient+Predictions.h"
#import "MBTAClient+Requests.h"

@implementation MBTAClient (Predictions)

- (NSURLSessionDataTask *)retrievePredictionsByStop:(NSString *)stop
                                includeAccessAlerts:(bool)includeAccessAlerts
                               includeServiceAlerts:(bool)includeServiceAlerts
                                         completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForPredictionsByStop:stop
                                                  includeAccessAlerts:includeAccessAlerts
                                                 includeServiceAlerts:includeServiceAlerts]
                         completion:completion];
}

- (NSURLSessionDataTask *)retrievePredictionsByRoute:(NSString *)route
                                 includeAccessAlerts:(bool)includeAccessAlerts
                                includeServiceAlerts:(bool)includeServiceAlerts
                                          completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForPredictionsByRoute:route
                                                   includeAccessAlerts:includeAccessAlerts
                                                  includeServiceAlerts:includeServiceAlerts]
                         completion:completion];
}

- (NSURLSessionDataTask *)retrieveVehiclesByRoute:(NSString *)route
                 includeAccessAlerts:(bool)includeAccessAlerts
                includeServiceAlerts:(bool)includeServiceAlerts
                         completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForVehiclesByRoute:route
                                                includeAccessAlerts:includeAccessAlerts
                                               includeServiceAlerts:includeServiceAlerts]
                         completion:completion];
}

- (NSURLSessionDataTask *)retrievePredictionsByTrip:(NSString *)trip
                                         completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForPredictionsByTrip:trip]
                         completion:completion];
}

- (NSURLSessionDataTask *)retrieveVehiclesByTrip:(NSString *)trip
                                      completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForVehiclesByTrip:trip]
                         completion:completion];
}

@end
