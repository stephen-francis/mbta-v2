#import "Constants.h"
#import "MBTAClient+Requests.h"

@implementation MBTAClient (Requests)

#pragma mark route requests
/*
 * route requests
 *
 * routes, routesByStop
 */
+ (NSURL *)requestForRoutes
{
	return [MBTAClient constructURLWithPath:kMBTA_REQ_ROUTES
							 parameters:nil];
}

+ (NSURL *)requestForRoutesByStop:(NSString *)stop
{
    if (!stop)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:stop forKey:@"stop"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_ROUTES_BY_STOP
							 parameters:params];
}

#pragma mark stop requests
/*
 * route requests
 *
 * stopsByRoute, stopsByLocation
 */
+ (NSURL *)requestForStopsByRoute:(NSString *)route
{
    if (!route)
        return nil;

    NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:route forKey:@"route"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_STOPS_BY_ROUTE
							 parameters:params];
}

+ (NSURL *)requestForStopsByLocationWithLat:(NSNumber *)lat withLon:(NSNumber *)lon
{
    if (!lat || !lon)
        return nil;
	
    NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:lat forKey:@"lat"];
	[params setObject:lon forKey:@"lon"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_STOPS_BY_LOC
							 parameters:params];
}


#pragma mark schedule requests
/*
 * schedulebystop, schedulebyroute, schedulebytrip
 */
 + (NSURL *)requestForScheduleByStop:(NSString *)stop
 							   route:(NSString *)route
 						   direction:(NSNumber *)direction
 							dateTime:(NSNumber *)dateTime
 							 maxTime:(NSNumber *)maxTime
 							maxTrips:(NSNumber *)maxTrips
{
    if (!stop)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];
    
    [params setObject:stop forKey:@"stop"];
    
    if (route)
        [params setObject:route forKey:@"route"];
    
    if (direction)
        [params setObject:direction forKey:@"direction"];
    
    if (dateTime)
        [params setObject:dateTime forKey:@"datetime"];
    
    if (maxTime)
        [params setObject:maxTime forKey:@"max_time"];
    
    if (maxTrips)
        [params setObject:maxTrips forKey:@"max_trips"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_SCHEDULE_BY_STOP
							 parameters:params];
}

+ (NSURL *)requestForScheduleByRoute:(NSString *)route
 						  direction:(NSNumber *)direction
 						   dateTime:(NSNumber *)dateTime
 							maxTime:(NSNumber *)maxTime
 						   maxTrips:(NSNumber *)maxTrips
{
    if (!route)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:route forKey:@"route"];
#warning should we enforce direction being equal to 0/1/etc?
    if (direction)
        [params setObject:direction forKey:@"direction"];
    
    if (dateTime)
        [params setObject:dateTime forKey:@"datetime"];
    
    if (maxTime)
	[params setObject:maxTime forKey:@"max_time"];
    
    if (maxTrips)
        [params setObject:maxTrips forKey:@"max_trips"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_SCHEDULE_BY_ROUTE
							 parameters:params];
}

+ (NSURL *)requestForScheduleByTrip:(NSString *)trip
 						   dateTime:(NSNumber *)dateTime
{
    if (!trip)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:trip forKey:@"trip"];
    
    if (dateTime)
        [params setObject:dateTime forKey:@"datetime"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_SCHEDULE_BY_ROUTE
							 parameters:params];
}

#pragma mark prediction requests
/*
 * predictionsbystop, predictionsbyroute, vehiclesbyroute, predictionsbytrip,
 * vehiclesbytrip
 */
+ (NSURL *)requestForPredictionsByStop:(NSString *)stop
 						   includeAccessAlerts:(bool)includeAccessAlerts
 						   includeServiceAlerts:(bool)includeServiceAlerts
{
    if (!stop)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:stop forKey:@"stop"];
    
	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];

	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_PREDICTIONS_BY_STOP
							 parameters:params];
}

+ (NSURL *)requestForPredictionsByRoute:(NSString *)route
 						   includeAccessAlerts:(bool)includeAccessAlerts
 						   includeServiceAlerts:(bool)includeServiceAlerts
{
    if (!route)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:route forKey:@"route"];

	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];

	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_PREDICTIONS_BY_ROUTE
							 parameters:params];
}

+ (NSURL *)requestForVehiclesByRoute:(NSString *)route
 						   includeAccessAlerts:(bool)includeAccessAlerts
 						   includeServiceAlerts:(bool)includeServiceAlerts
{
    if (!route)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:route forKey:@"route"];

	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];

	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_VEHICLES_BY_ROUTE
							 parameters:params];
}

+ (NSURL *)requestForPredictionsByTrip:(NSString *)trip
{
    if (!trip)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];
	[params setObject:trip forKey:@"trip"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_PREDICTIONS_BY_TRIP
							 parameters:params];
}

+ (NSURL *)requestForVehiclesByTrip:(NSString *)trip
{
    if (!trip)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];
	[params setObject:trip forKey:@"trip"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_VEHICLES_BY_TRIP
							 parameters:params];
}


#pragma mark alert requests
/*
 * alertsToIncludeAccessAlerts, alertsByRoute, alertsByStop, alertById,
 * alertHeadersToIncludeAccessAlerts,, alertHeadersByRoute, alertHeadersByStop
 */
+ (NSURL *)requestForAlertsToIncludeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts
{
	NSMutableDictionary *params = [NSMutableDictionary new];

	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];

	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_ALERTS
							 parameters:params];
}

+ (NSURL *)requestForAlertsByRoute:(NSString *)route
						includeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts
{
    if (!route)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];
    
    [params setObject:route forKey:@"route"];

	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];

	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_ALERTS_BY_ROUTE
							 parameters:params];
}

+ (NSURL *)requestForAlertsByStop:(NSString *)stop
						includeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts
{
    if (!stop)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:stop forKey:@"stop"];

	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];

	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_ALERTS_BY_STOP
							 parameters:params];
}

+ (NSURL *)requestForAlertByID:(NSString *)ID
						includeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts
{
    if (!ID)
        return nil;
    
	NSMutableDictionary *params = [NSMutableDictionary new];
	[params setObject:ID forKey:@"id"];

	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];

	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_ALERTS_BY_ID
							 parameters:params];
}

+ (NSURL *)requestForAlertHeadersToIncludeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts
{
	NSString *includeAccessAlertsStr = includeAccessAlerts ?@"true" : @"false";
	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";

	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_ALERT_HEADERS
							 parameters:params];
}

+ (NSURL *)requestForAlertHeadersByRoute:(NSString *)route
				     includeAccessAlerts:(bool)includeAccessAlerts
 				    includeServiceAlerts:(bool)includeServiceAlerts
{
    if (!route)
        return nil;
    
	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";

	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:route forKey:@"route"];
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_ALERT_HEADERS_BY_ROUTE
							 parameters:params];
}

+ (NSURL *)requestForAlertHeadersByStop:(NSString *)stop
				     includeAccessAlerts:(bool)includeAccessAlerts
 				    includeServiceAlerts:(bool)includeServiceAlerts
{
    if (!stop)
        return nil;
    
	NSString *includeAccessAlertsStr = includeAccessAlerts ? @"true" : @"false";
	NSString *includeServiceAlertsStr = includeServiceAlerts ? @"true" : @"false";

	NSMutableDictionary *params = [NSMutableDictionary new];

	[params setObject:stop forKey:@"stop"];
	[params setObject:includeAccessAlertsStr forKey:@"include_access_alerts"];
	[params setObject:includeServiceAlertsStr forKey:@"include_service_alerts"];

	return [MBTAClient constructURLWithPath:kMBTA_REQ_ALERT_HEADERS_BY_STOP
							 parameters:params];
}

#pragma mark other requests
/*
 * serverTime
 */
+ (NSURL *)requestServerTime
{

	return [MBTAClient constructURLWithPath:kMBTA_REQ_SERVER_TIME
							 parameters:nil];
}

#pragma mark helper methods
/*
 * creates url with specified path and params
 * @param path the path of the request, eg @"routesByStop" for routesByStop req
 * @param parameters params for http REST req, could be @{@"stop" : @"70065"}
 * @returns the url with path, params, and base url and apiKey
 *
 */
+ (NSURL *)constructURLWithPath:(NSString *)path
                     parameters:(NSDictionary *)parameters 
{
    NSMutableString *parametersString = [NSMutableString stringWithString:kMBTA_BASE_URL];
    
    [parametersString appendString:path];
    [parametersString appendString:[NSString stringWithFormat:@"?api_key=%@", [[MBTAClient shared] apiKey]]];
    
    if (parameters)
    {
        NSEnumerator *enumerator = [parameters keyEnumerator];
        NSString *enumerationKey;
        id value;
        
        while ((enumerationKey = (NSString *)[enumerator nextObject]))
        {
            value = parameters[enumerationKey];
            //DLog(@"value: " @"%@", value);
            
            NSString *urlEncodedValue;
            if ([value isKindOfClass:[NSNumber class]])
            {
                urlEncodedValue = [value stringValue];
            } 
            else
            {
                urlEncodedValue = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            }
            
            if(!urlEncodedValue)
            {
                urlEncodedValue = @"";
            }
            [parametersString appendFormat:@"&%@=%@", enumerationKey, urlEncodedValue];
        }
    }

    [parametersString appendString:@"&format=json/"];

    return [NSURL URLWithString:parametersString];
}

 @end