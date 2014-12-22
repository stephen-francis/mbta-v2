
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

@end

@interface MBTAConverter : NSObject
@property (weak, nonatomic) id<MBTAConverterDelegate> delegate;
/*
 * Parses a JSON response of routes, retrieved from the MBTA 
 * @param routesJSON is the JSON response
 * @returns an array of MBTARoute objects parsed from the response
 *
 */
+ (NSArray *)convertRoutes:(NSData *)routesResponse;
+ (NSArray *)convertRoutesByStop:(NSData *)routesResponse;

+ (NSArray *)convertStopsByRoute:(NSData *)routesResponse;
+ (NSArray *)convertStopsByLocation:(NSData *)routesResponse;
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
