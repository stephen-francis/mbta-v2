//
//  MBTAClient+Alerts.h
//  MBTAFramework
//
//  Created by Stephen Francis on 12/16/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "MBTAClient.h"
#import "MBTAClient+Requests.h"

@interface MBTAClient (Alerts)
- (NSURLSessionDataTask *)retrieveAlertsToIncludeAccessAlerts:(bool)includeAccessAlerts
                                         includeServiceAlerts:(bool)includeServiceAlerts
                                                   completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveAlertsByRoute:(NSString *)route
               includeAccessAlerts:(bool)includeAccessAlerts
              includeServiceAlerts:(bool)includeServiceAlerts
                        completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveAlertsByStop:(NSString *)stop
              includeAccessAlerts:(bool)includeAccessAlerts
             includeServiceAlerts:(bool)includeServiceAlerts
                       completion:(MBTAClientCompletion)completion;


- (NSURLSessionDataTask *)retrieveAlertByID:(NSString *)ID
                         includeAccessAlerts:(bool)includeAccessAlerts
                        includeServiceAlerts:(bool)includeServiceAlerts
                                  completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveAlertHeadersToIncludeAccessAlerts:(bool)includeAccessAlerts
                                               includeServiceAlerts:(bool)includeServiceAlerts
                                                         completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveAlertHeadersByRoute:(NSString *)route
                                  includeAccessAlerts:(bool)includeAccessAlerts
                                 includeServiceAlerts:(bool)includeServiceAlerts
                                           completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveAlertHeadersByStop:(NSString *)stop
                                 includeAccessAlerts:(bool)includeAccessAlerts
                                includeServiceAlerts:(bool)includeServiceAlerts
                                          completion:(MBTAClientCompletion)completion;

- (NSURLSessionDataTask *)retrieveServerTimeWithCompletion:(MBTAClientCompletion)completion;



@end
