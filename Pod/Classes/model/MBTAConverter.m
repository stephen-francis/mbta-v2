//
//  MBTAConverter.m
//  GetThereFromHere
//
//  Created by Stephen Francis on 4/15/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import "Constants.h"
#import "MBTAClient.h"
#import "MBTAConverter.h"

#import "MBTARoute.h"
#import "MBTARouteStop.h"
#import "MBTAStop.h"

@implementation MBTAConverter

#pragma route conversion
+ (NSArray *)convertRoutes:(NSData *)routesResponse
{
    if (!routesResponse)
        return nil;
    
    NSError *jsonSerialError;
    NSDictionary *routesJSON = [MBTAConverter dictionarySerializedForData:routesResponse
                                                                      error:&jsonSerialError];
    // todo: future MBTAManager class will define delegate with error handling
    if (jsonSerialError)
        return nil;
    
    NSMutableArray *routes = [[NSMutableArray alloc] init];
    MBTARoute *route;

    for (NSDictionary *modeElm in [routesJSON objectForKey:kMBTA_MODE])
    {
        for (NSDictionary *routeElm in [modeElm objectForKey:kMBTA_ROUTE])
        {
            route = [MBTAConverter routeForDictionary:routeElm];
            
            route.modeName = [modeElm objectForKey:kMBTA_MODE_NAME];
            route.routeType = [[modeElm objectForKey:kMBTA_ROUTE_TYPE] intValue];
            
            [routes addObject:route];
        }
    }
    
    return routes;
}

+ (NSArray *)convertRoutesByStop:(NSData *)routesByStopResponse
{
    return [MBTAConverter convertRoutes:routesByStopResponse];
}

#pragma stop conversion
+ (NSArray *)convertStopsByRoute:(NSData *)stopsByRouteResponse
{
    if (!stopsByRouteResponse)
        return nil;
    
    NSError *jsonSerialError;
    NSDictionary *stopsByRouteJSON = [MBTAConverter dictionarySerializedForData:stopsByRouteResponse
                                                                      error:&jsonSerialError];
    // todo: future MBTAManager class will define delegate with error handling
    if (jsonSerialError)
        return nil;
    
    MBTARouteStop *stop;
    NSMutableArray *stops = [[NSMutableArray alloc] init];
    
    // look at each direction in res
    for (NSDictionary *directionElm in [stopsByRouteJSON objectForKey:kMBTA_ROUTE_INFO_DIRECTION])
    {
        // parse each of its stops
        for (NSDictionary *stopElm in [directionElm objectForKey:kMBTA_STOP])
        {
            stop = (MBTARouteStop *)[MBTAConverter stopForDictionary:stopElm];
            
            // parse corresponding info about the route this stop is on
            stop.routeInfo.directionID = [directionElm objectForKey:kMBTA_ROUTE_INFO_DIRECTION_ID];
            stop.routeInfo.directionName = [directionElm objectForKey:kMBTA_ROUTE_INFO_DIRECTION_NAME];
            stop.routeInfo.stopOrder = [stopElm objectForKey:kMBTA_ROUTE_INFO_STOP_ORDER];
#warning we need to get routeID as a param, otherwise this info is useless
            [stops addObject:stop];
        }
    }
    
    return stops;
}

+ (NSArray *)convertStopsByLocation:(NSData *)stopsByLocationResponse
{
    if (!stopsByLocationResponse)
        return nil;
    
    NSError *jsonSerialError;
    NSDictionary *stopsByLocationJSON = [MBTAConverter dictionarySerializedForData:stopsByLocationResponse
                                                                          error:&jsonSerialError];
    // todo: future MBTAManager class will define delegate with error handling
    if (jsonSerialError)
        return nil;
    
    MBTAStop *stop;
    NSMutableArray *stops = [[NSMutableArray alloc] init];
    for (NSDictionary *stopElm in [stopsByLocationJSON objectForKey:kMBTA_STOP])
    {
        stop = [MBTAConverter stopForDictionary:stopElm];
        [stops addObject:stop];
    }
    
    return stops;
}

#pragma sched conversion
+ (NSArray *)convertScheduleByStop:(NSDictionary *)scheduleByStopResponse
{
    if (!scheduleByStopResponse)
        return nil;
    
    return nil;
}

+ (NSArray *)convertScheduleByRoute:(NSDictionary *)scheduleByRouteResponse
{
    if (!scheduleByRouteResponse)
        return nil;
    
    return nil;
}

+ (NSArray *)convertScheduleByTrip:(NSDictionary *)scheduleByTripResponse
{
    if (!scheduleByTripResponse)
        return nil;
    return nil;
}

#pragma pred conversion
+ (NSArray *)convertPredictionsByStop:(NSDictionary *)predictionsByStopResponse
{
    if (!predictionsByStopResponse)
        return nil;
    return nil;
}

+ (NSArray *)convertPredictionsByRoute:(NSDictionary *)predictionsByRouteResponse
{
    if (!predictionsByRouteResponse)
        return nil;
    return nil;
}

+ (NSArray *)convertVehiclesByRoute:(NSDictionary *)vehiclesByRouteResponse
{
    if (!vehiclesByRouteResponse)
        return nil;
    return nil;
}

+ (NSArray *)convertPredictionsByTrip:(NSDictionary *)predictionsByTripResponse
{
    if (!predictionsByTripResponse)
        return nil;
    return nil;
}

+ (NSArray *)convertVehiclesByTrip:(NSDictionary *)vehiclesByTripResponse
{
    if (!vehiclesByTripResponse)
        return nil;
    return nil;
}

#pragma alert conversion

#pragma helper methods
+ (NSDictionary *)dictionarySerializedForData:(NSData *)data error:(NSError **)error
{
    if (!data)
        return nil;
    
    NSError *localError;
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&localError];
    if (localError)
    {
        *error = localError;
        return nil;
    }
    
    return jsonResponse;
    
}

+ (MBTAStop *)stopForDictionary:(NSDictionary *)dictionary
{
    if (!dictionary)
        return nil;
    
    MBTAStop *stop = [[MBTAStop alloc] init];
    stop = [[MBTAStop alloc] init];
    stop.distance = [dictionary objectForKey:kMBTA_DISTANCE];
    stop.parentStation = [dictionary objectForKey:kMBTA_PARENT_STATION];
    stop.parentStationName = [dictionary objectForKey:kMBTA_PARENT_STATION_NAME];
    stop.stopID = [dictionary objectForKey:kMBTA_STOP_ID];
    stop.stopLat = [dictionary objectForKey:kMBTA_STOP_LAT];
    stop.stopLon = [dictionary objectForKey:kMBTA_STOP_LON];
    stop.stopName = [dictionary objectForKey:kMBTA_STOP_NAME];
    
    return stop;
}

+ (MBTARoute *)routeForDictionary:(NSDictionary *)dictionary
{
    if (!dictionary)
        return nil;
    
    MBTARoute *route = [[MBTARoute alloc] init];
    route = [[MBTARoute alloc] init];
    route.routeID = [dictionary objectForKey:kMBTA_ROUTE_ID];
    route.routeName = [dictionary objectForKey:kMBTA_ROUTE_NAME];
    
    return route;
}



@end