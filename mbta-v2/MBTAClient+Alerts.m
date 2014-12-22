//
//  MBTAClient+Alerts.m
//  MBTAFramework
//
//  Created by Stephen Francis on 12/16/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "MBTAClient+Alerts.h"

@implementation MBTAClient (Alerts)
- (NSURLSessionDataTask *)retrieveAlertsToIncludeAccessAlerts:(bool)includeAccessAlerts
                          includeServiceAlerts:(bool)includeServiceAlerts
                                    completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForAlertsToIncludeAccessAlerts:includeAccessAlerts
                                                           includeServiceAlerts:includeServiceAlerts]
                         completion:completion];
}



- (NSURLSessionDataTask *)retrieveAlertsByRoute:(NSString *)route
             includeAccessAlerts:(bool)includeAccessAlerts
            includeServiceAlerts:(bool)includeServiceAlerts
                      completion:(MBTAClientCompletion)completion
{
        return [self fetchContentsOfURL:[MBTAClient requestForAlertsByRoute:route
                                                  includeAccessAlerts:includeAccessAlerts
                                                 includeServiceAlerts:includeServiceAlerts]
                             completion:completion];
}



- (NSURLSessionDataTask *)retrieveAlertsByStop:(NSString *)stop
            includeAccessAlerts:(bool)includeAccessAlerts
           includeServiceAlerts:(bool)includeServiceAlerts
                     completion:(MBTAClientCompletion)completion
{
    
        return [self fetchContentsOfURL:[MBTAClient requestForAlertsByStop:stop
                                                 includeAccessAlerts:includeAccessAlerts
                                                includeServiceAlerts:includeServiceAlerts]
                             completion:completion];
}


- (NSURLSessionDataTask *)retrieveAlertByID:(NSString *)ID
          includeAccessAlerts:(bool)includeAccessAlerts
         includeServiceAlerts:(bool)includeServiceAlerts
                   completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForAlertByID:ID
                                           includeAccessAlerts:includeAccessAlerts
                                          includeServiceAlerts:includeServiceAlerts]
                         completion:completion];
}




- (NSURLSessionDataTask *)retrieveAlertHeadersToIncludeAccessAlerts:(bool)includeAccessAlerts
                                includeServiceAlerts:(bool)includeServiceAlerts
                                          completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForAlertHeadersToIncludeAccessAlerts:includeAccessAlerts
                                                                 includeServiceAlerts:includeServiceAlerts]
                         completion:completion];
}



- (NSURLSessionDataTask *)retrieveAlertHeadersByRoute:(NSString *)route
                   includeAccessAlerts:(bool)includeAccessAlerts
                  includeServiceAlerts:(bool)includeServiceAlerts
                            completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForAlertHeadersByRoute:route
                                                    includeAccessAlerts:includeAccessAlerts
                                                   includeServiceAlerts:includeServiceAlerts]
                         completion:completion];
}

- (NSURLSessionDataTask *)retrieveAlertHeadersByStop:(NSString *)stop
                  includeAccessAlerts:(bool)includeAccessAlerts
                 includeServiceAlerts:(bool)includeServiceAlerts
                           completion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestForAlertHeadersByStop:stop
                                                   includeAccessAlerts:includeAccessAlerts
                                                  includeServiceAlerts:includeServiceAlerts]
                         completion:completion];
}



- (NSURLSessionDataTask *)retrieveServerTimeWithCompletion:(MBTAClientCompletion)completion
{
    return [self fetchContentsOfURL:[MBTAClient requestServerTime] completion:completion];
}



@end
