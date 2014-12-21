
//
//  MBTAConverter.h
//  GetThereFromHere
//
//  Created by Stephen Francis on 4/15/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MBTAConverterDelegate

- (void)didRetrieveRoutes:(NSArray *)routes;
/*
- (void)didRetrieveRoutesForStop:(NSArray *)stopRoutes;

- (void)didRetrieveStopsForRoute:(NSDictionary *)stopsForRoute;

- (void)didRetrieveScheduleForStop:(NSArray *)predictions;

- (void)didRetrievePredictionsForLine:(NSDictionary *)predictionsByDestination;

- (void)fetchingTransitJSONFailedWithError:(NSError *)error;
*/
@end

@interface MBTAConverter : NSObject
@property (weak, nonatomic) id<MBTAConverterDelegate> delegate;
/*
 * Parses a JSON response of routes, retrieved from the MBTA 
 * @param routesJSON is the JSON response
 * @returns an array of MBTARoute objects parsed from the response
 *
 */
//+ (NSArray *)routesFromResponse:(NSDictionary *)routesJSON;

+ (NSArray *)convertRoutes:(NSDictionary *)routesResponse;
+ (NSArray *)convertRoutesByStop:(NSDictionary *)routesByStopResponse;

+ (NSArray *)convertStopsByRoute:(NSDictionary *)stopsByRouteResponse;
+ (NSArray *)convertStopsByLocation:(NSDictionary *)stopsByLocationResponse;
/*
+ (NSArray *)convertScheduleByRoute:(NSDictionary *)scheduleByRouteResponse;
+ (NSArray *)convertScheduleByStop:(NSDictionary *)scheduleByStopResponse;
+ (NSArray *)convertScheduleByTrip:(NSDictionary *)scheduleByTripResponse;

+ (NSArray *)convertPredictionsByRoute:(NSDictionary *)predictionsByRouteResponse;
+ (NSArray *)convertPredictionsByStop:(NSDictionary *)predictionsByStopResponse;
+ (NSArray *)convertPredictionsByTrip:(NSDictionary *)predictionsByTripResponse;
+ (NSArray *)convertVehiclesByRoute:(NSDictionary *)vehiclesByRouteResponse;
+ (NSArray *)convertVehiclesByTrip:(NSDictionary *)vehiclesByTripResponse;

+ (NSArray *)convertAlertsByRoute:(NSDictionary *)alertsByRouteResponse;
+ (NSArray *)convertAlertsByStop:(NSDictionary *)alertsByStopResponse;
+ (NSArray *)convertAlertByID:(NSDictionary *)AlertByIDResponse;
+ (NSArray *)convertAlertHeadersByRoute:(NSDictionary *)alertHeadersByRouteResponse;
+ (NSArray *)convertAlertHeadersByStop:(NSDictionary *)alertHeadersByStopResponse;
*/

@end
//+ (void)retrieveMBTARoutes;


/*
+ (NSArray *)nearestStopsFromJSON:(NSDictionary *)nearestStopsJSON;
+ (NSArray *)routesFromStop:(NSDictionary *)stopRoutesJSON;
+ (NSDictionary *)stopsOnRoute:(NSDictionary *)stopsRoute;
+ (NSArray *)predictionsForSchedule:(NSDictionary *)schedule;
+ (NSDictionary *)predictionsStoredByDestinationFromInfo:(NSDictionary *)predictionsInfo;
+ (NSArray *)routesInGTFSRouteFile;
*/

/*
///routes//////////////////////////////////////////////////////////////////////
 - (NSURLSessionDataTask *)retrieveRoutesWithCompletion:(MBTAClientCompletion)completion;
 - (NSURLSessionDataTask *)retrieveRoutesByStop:(NSString *)stopID
 withCompletion:(MBTAClientCompletion)completion;

 
///stops//////////////////////////////////////////////////////////////////////
 - (NSURLSessionDataTask *)retrieveStopsByRoute:(NSString *)routeID
 completion:(MBTAClientCompletion)completion;
 - (NSURLSessionDataTask *)retrieveStopsByLocationWithLat:(NSNumber *)lat lon:(NSNumber *)lon
 completion:(MBTAClientCompletion)completion;

 
///sched//////////////////////////////////////////////////////////////////////
 - (NSURLSessionDataTask *)retrieveScheduleByStop:(NSString *)stop
 route:(NSString *)route
 direction:(NSNumber *)direction
 dateTime:(NSNumber *)dateTime
 maxTime:(NSNumber *)maxTime
 maxTrips:(NSNumber *)maxTrips
 completion:(MBTAClientCompletion)completion;
 
 - (NSURLSessionDataTask *)retrieveScheduleByRoute:(NSString *)stop
 route:(NSString *)route
 direction:(NSNumber *)direction
 dateTime:(NSNumber *)dateTime
 maxTime:(NSNumber *)maxTime
 maxTrips:(NSNumber *)maxTrips
 completion:(MBTAClientCompletion)completion;
 
 - (NSURLSessionDataTask *)retrieveScheduleByTrip:(NSString *)trip
 dateTime:(NSNumber *)dateTime
 completion:(MBTAClientCompletion)completion;
 
 
///preds//////////////////////////////////////////////////////////////////////
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
 
 
///alerts//////////////////////////////////////////////////////////////////////
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
 
 

 */

