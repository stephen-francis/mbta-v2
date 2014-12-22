/*
@"http://realtime.mbta.com/developer/api/v2/stopsbylocation?api_key=wX9NwuHnZU2ToO7GmGR9
uw&lat=42.346961&lon=-71.076640&format=json"
*/

#import <Foundation/Foundation.h>
#import "MBTAClient.h"

@interface MBTAClient (Requests)
/*
 * This query will return a complete list of routes for which data can be requested through the web services.
 *
 * Special Parameters:
 * None. 
 *
 * Example: 
 * http://realtime.mbta.com/developer/api/v2/routes?api_key=wX9NwuHnZU2ToO7GmGR9uw&format=json
 */
 #define kMBTA_REQ_ROUTES @"routes"


+ (NSURL *)requestForRoutes;

/*
 * ROUTESBYSTOP
 *
 * This query will return a list of routes that serve a particular stop.
 *
 * Special Parameters:
 * stop		GTFS-compatible stop_id value for which routes should be returned.
 *
 * Data type: String
 * Example: 
 * “70065”
 *
 * Example:
 * http://realtime.mbta.com/developer/api/v2/routesbystop?api_key=wX9NwuHnZU2ToO7GmGR9uw&stop=70065&format=json
 */
 #define kMBTA_REQ_ROUTES_BY_STOP @"routesbystop"

+ (NSURL *)requestForRoutesByStop:(NSString *)stop;

/*
 * STOPSBYROUTE
 * This query will return a list of stops for a particular route.
 * Special Parameters:
 * 
 * route 	GTFS-compatible route_id value for which stops should be returned
 * Data type: String
 * Example: “931_”
 * 
 * Example
 * http://realtime.mbta.com/developer/api/v2/stopsbyroute?api_key=wX9NwuHnZU2ToO7GmGR9uw&
 * route=931_&format=json
 */
#define kMBTA_REQ_STOPS_BY_ROUTE @"stopsbyroute"

+ (NSURL *)requestForStopsByRoute:(NSString *)route;

/*
 * STOSPBYLOCATION
 *
 * This query will return a list of the nearest stops from a particular location. Up to 15 are returned, within a
 * 1-mile radius.
 * 
 * Special Parameters:
 * lat The latitude for location near which stops should be returned
 * Data type: Float
 * Example: “42.352913”
 * 
 * lon The longitude for location near which stops should be returned
 * Data type: Float
 * Example: “-71.064648”
 *
 * Example: 
 * http://realtime.mbta.com/developer/api/v2/stopsbylocation?api_key=wX9NwuHnZU2ToO7GmGR9
 * uw&lat=42.346961&lon=-71.076640&format=json
 */
#define kMBTA_REQ_STOPS_BY_LOC @"stopsbylocation"

+ (NSURL *)requestForStopsByLocationWithLat:(NSNumber *)lat withLon:(NSNumber *)lon;



#pragma schedule requests
/*
 * Schedule Queries: schedulebystop, schedulebyroute, schedulebytrip
 */
 


/*
 * SCHEDULEBYSTOP
 * This query will return scheduled arrivals and departures for a direction and route for a particular stop.
 * 
 * Special Parameters:
 * stop 	GTFS-compatible stop_id value for which schedule should be returned. String.
 * Example: “Back Bay”

 * route (optional) 	GTFS-compatible route_id value on the stop for which schedule should be
 * returned. String.
 * If not included then schedule for all routes serving the stop will be returned
 * Example: “CR-Providence”
 * 
 * direction (optional) 	GTFS-compatible direction_id value on route of the stop for which schedule should
 * be returned. Bit (0 or 1).
 * If included then route must also be included
 * If not included then schedule for all directions of the route serving the stop will be
 * returned
 * Example: “0”
 * 
 * datetime (optional) 	Epoch time after which schedule should be returned. Integer.
 * If included then must be within the next seven (7) days
 * If not included then schedule starting from the current datetime will be returned
 * Example: “1361989200”
 * 
 * max_time (optional) 	Defines maximum range of time (in minutes) within which trips will be returned.
 * Integer between 1 and 1440 (24 hours).
 * if not included defaults to 60.
 * Example: “120”
 *  
 * max_trips (optional) 	Defines number of trips to return. Integer between 1 and 100.
 * If not included defaults to 5.
 * Example: “100”
 * 
 * Example:
 * http://realtime.mbta.com/developer/api/v2/schedulebystop?api_key=wX9NwuHnZU2ToO7GmGR9uw&stop=Back%20Bay&route=CR-Providence&direction=0&format=json
 * 
 */
#define kMBTA_REQ_SCHEDULE_BY_STOP @"schedulebystop"

 + (NSURL *)requestForScheduleByStop:(NSString *)stop
 							   route:(NSString *)route
 						   direction:(NSNumber *)direction
 							dateTime:(NSNumber *)dateTime
 							 maxTime:(NSNumber *)maxTime
 							maxTrips:(NSNumber *)maxTrips;

/*
 * SCHEDULEBYROUTE
 * This query will return the scheduled arrivals and departures in a direction for a particular route.
 * Special Parameters:
 *
 * route 	GTFS-compatible route_id value for which schedule should be returned
 * Data type: String
 * Example: “CR-Providence”

 * direction (optional) 	GTFS-compatible direction_id value on route for which schedule should be
 * returned
 * If not included then schedule for all directions of the route will be returned
 * Data type: Bit (0 or 1)
 * Example: “0”

 * datetime (optional) 		Epoch time after which schedule should be returned
 * If included then must be within the next seven (7) days
 * If not included then schedule starting from the current datetime will be returned
 * Data type: Integer
 * Example: “1361989200”

 * max_time (optional) 		Defines maximum range of time (in minutes) within which trips will be returned.
 * Integer between 1 and 1440 (24 hours).
 * If not included defaults to 60.
 * Example: “120”

 * max_trips (optional) 	Defines number of trips to return. Integer between 1 and 100.
 * If not included defaults to 5.
 * Example: “100”
 * 
 * 
 * Example
 * http://realtime.mbta.com/developer/api/v2/schedulebyroute?api_key=wX9NwuHnZU2ToO7GmGR9uw&route=CR-Providence&direction=0&format=json
 */
#define kMBTA_REQ_SCHEDULE_BY_ROUTE @"schedulebyroute"

+ (NSURL *)requestForScheduleByRoute:(NSString *)route
 						  direction:(NSNumber *)direction
 						   dateTime:(NSNumber *)dateTime
 							maxTime:(NSNumber *)maxTime
 						   maxTrips:(NSNumber *)maxTrips;

/*
 * SCHEDULEBYTRIP
 * This query will return the scheduled arrivals and departures for a particular trip.
 * Special Parameters
 * 
 * trip 	GTFS-compatible trip_id value for which schedule should be returned
 * Data type: String
 * Example: “CR-Providence-CR-Weekday-807”

 * datetime (optional) 		Epoch time after which schedule should be returned
 * If included then must be within the next seven (7) days
 * If not included then schedule starting from the current datetime will be returned
 * Data type: Integer
 * Example: “1361989200”
 *
 * Example 	
 * http://realtime.mbta.com/developer/api/v2/schedulebytrip?api_key=wX9NwuHnZU2ToO7GmGR9uw&trip=CR-Providence-CR-Weekday-Providence-Dec13-813&format=json
 */
#define kMBTA_REQ_SCHEDULE_BY_TRIP @"schedulebytrip"

+ (NSURL *)requestForScheduleByTrip:(NSString *)trip
 						   dateTime:(NSNumber *)dateTime;

#pragma prediction requests
/*
 * PREDICTIONS

 @"predictionsbystop"
@"predictionsbyroute"
@"vehiclesbyroute"
@"predictionsbytrip"
@"vehiclesbytrip" 
 */



/*
PREDICTIONSBYSTOP
This query will return predicted arrivals and departures in the next hour for a direction and route for a
particular stop.

Special Parameters:

stop 	GTFS-compatible stop_id value for which predictions should be returned
Data type: String
Example: “Back Bay”
include_access_alerts (optional) 	Whether or not alerts pertaining to accessibility (elevators, escalators)
should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “false”
If not included, then alerts pertaining to accessibility are not returned

include_service_alerts (optional) 	Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “true”
If not included, then service alerts will be returned

Example:
http://realtime.mbta.com/developer/api/v2/predictionsbystop?api_key=wX9NwuHnZU2ToO7GmG
R9uw&stop=Providence&format=json
*/
#define kMBTA_REQ_PREDICTIONS_BY_STOP @"predictionsbystop"

+ (NSURL *)requestForPredictionsByStop:(NSString *)stop
 						   includeAccessAlerts:(bool)includeAccessAlerts
 						   includeServiceAlerts:(bool)includeServiceAlerts;

/*
PREDICTIONSBYROUTE
This query will return predictions for upcoming trips (including trips already underway) in a direction for a
particular route.
Special Parameters
Name Description
route GTFS-compatible route_id value for which predictions should be returned
Data type: String
Example: “931_”
include_access_alerts
(optional)
Whether or not alerts pertaining to accessibility (elevators, escalators) should be
returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “false”
If not included, then alerts pertaining to accessibility are not returned
include_service_alerts
(optional)
Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “true”
If not included, then service alerts will be returned


Example:
http://realtime.mbta.com/developer/api/v2/predictionsbyroute?api_key=wX9NwuHnZU2ToO7Gm
GR9uw&route=CR-Providence&format=json

*/
#define kMBTA_REQ_PREDICTIONS_BY_ROUTE @"predictionsbyroute"

+ (NSURL *)requestForPredictionsByRoute:(NSString *)route
 						   includeAccessAlerts:(bool)includeAccessAlerts
 						   includeServiceAlerts:(bool)includeServiceAlerts;

/*
VEHICLESBYROUTE
This query will return vehicle positions for upcoming trips (including trips already underway) in a direction
for a particular route.
Special Parameters:


route 	GTFS-compatible route_id value for which vehicle positions should be returned
Data type: String
Example: “931_

Example:
http://realtime.mbta.com/developer/api/v2/vehiclesbyroute?api_key=wX9NwuHnZU2ToO7GmGR9
uw&route=CR-Providence&format=json
 */

#define kMBTA_REQ_VEHICLES_BY_ROUTE @"vehiclesbyroute"

+ (NSURL *)requestForVehiclesByRoute:(NSString *)route
 						   includeAccessAlerts:(bool)includeAccessAlerts
 						   includeServiceAlerts:(bool)includeServiceAlerts;

/*

PREDICTIONSBYTRIP
This query will return the predicted arrivals and departures for a particular trip.
Special Parameters
Name Description
trip GTFS-compatible trip_id value for which predictions should be returned
Data type: String
Example: “CR-Providence-CR-Weekday-807”

Example
http://realtime.mbta.com/developer/api/v2/predictionsbytrip?api_key=wX9NwuHnZU2ToO7GmG
R9uw&trip=CR-Providence-CR-Weekday-Providence-Dec13-913&format=json
 */

#define kMBTA_REQ_PREDICTIONS_BY_TRIP @"predictionsbytrip"

+ (NSURL *)requestForPredictionsByTrip:(NSString *)trip;

/*
VEHICLESBYTRIP
This query will return the predicted vehicle positions for a particular trip.
Special Parameters

trip 	GTFS-compatible trip_id value for which vehicle positions should be
returned
Data type: String
Example: “CR-Providence-CR-Weekday-807”

Example:
http://realtime.mbta.com/developer/api/v2/vehiclesbytrip?api_key=wX9NwuHnZU2ToO7GmGR9u
w&trip=CR-Providence-CR-Weekday-Providence-Dec13-818&format=json
 */

#define kMBTA_REQ_VEHICLES_BY_TRIP @"vehiclesbytrip"

+ (NSURL *)requestForVehiclesByTrip:(NSString *)trip;

#pragma alert requests
// ALERTS /////////////////////////////////////////////////////////////////////////////////////////


/*
ALERTS
This query will return details for all alerts.

Special Parameters:
include_access_alerts (optional) 	Whether or not alerts pertaining to accessibility (elevators, escalators) should
be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “false”
If not included, then alerts pertaining to accessibility are not returned

include_service_alerts (optional) 	Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “true”
If not included, then service alerts will be returned

Example
http://realtime.mbta.com/developer/api/v2/alerts?api_key=wX9NwuHnZU2ToO7GmGR9uw&includ
e_access_alerts=true&include_service_alerts=true&format=json
*/

#define kMBTA_REQ_ALERTS @"alerts"

+ (NSURL *)requestForAlertsToIncludeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts;
/*
ALERTSBYROUTE
This query will return alerts affecting a particular route.

Special Parameters:
route GTFS-compatible route_id value for which alerts should be returned
Data type: String
Example: “931_”

include_access_alerts
(optional)
Whether or not alerts pertaining to accessibility (elevators, escalators)
should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “false”
If not included, then alerts pertaining to accessibility are not returned

include_service_alerts
(optional)
Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “true”
If not included, then service alerts will be returned

Example:
http://realtime.mbta.com/developer/api/v2/alertsbyroute?api_key=wX9NwuHnZU2ToO7GmGR9uw
&route=931_&include_access_alerts=true&include_service_alerts=true&format=json
*/

#define kMBTA_REQ_ALERTS_BY_ROUTE @"alertsbyroute"

+ (NSURL *)requestForAlertsByRoute:(NSString *)route
						includeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts;

/*
ALERTSBYSTOP

This query will return alerts affecting a particular stop.MBTA and IBI GROU P


Special Parameters:
stop GTFS-compatible stop_id value for which alerts should be returned
Data type: String
Example: “place-portr”

include_access_alerts
(optional)
Whether or not alerts pertaining to accessibility (elevators, escalators)
should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “false”
If not included, then alerts pertaining to accessibility are not returned

include_service_alerts
(optional)
Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “true”
If not included, then service alerts will be returned

Example:
http://realtime.mbta.com/developer/api/v2/alertsbystop?api_key=wX9NwuHnZU2ToO7GmGR9uw&
stop=Porter%20Square&include_access_alerts=true&include_service_alerts=true&format=jso
n
*/

#define kMBTA_REQ_ALERTS_BY_STOP @"alertsbystop"

+ (NSURL *)requestForAlertsByStop:(NSString *)stop
						includeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts;

/*
ALERTBYID

This query will return details for a particular alert.

Special Parameters:

id 		Unique identifier for the alert
Type: Integer
Example: “781”MBTA and IBI GROU P


include_access_alerts
(optional)
Whether or not alerts pertaining to accessibility (elevators, escalators) should
be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “false”
If not included, then alerts pertaining to accessibility are not returned

include_service_alerts
(optional)
Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “true”
If not included, then service alerts will be returned


Example:
http://realtime.mbta.com/developer/api/v2/alertbyid?api_key=wX9NwuHnZU2ToO7GmGR9uw
&id=33274&format=json

http://54.81.189.97/developer/api/v2/alertbyid?api_key=wX9NwuHnZU2ToO7G
mGR9uw&include_access=true&include_service=true&id=33274&format=json
*/

#define kMBTA_REQ_ALERTS_BY_ID @"alertbyid"

+ (NSURL *)requestForAlertByID:(NSString *)ID
						includeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts;

/*
ALERTSHEADERS

This query will return headers for all alerts.

Special Parameters:

include_access_alerts
(optional)
Whether or not alerts pertaining to accessibility (elevators, escalators)
should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “false”
If not included, then alerts pertaining to accessibility are not returnedMBTA and IBI GROU P



include_service_alerts
(optional)
Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “true”
If not included, then service alerts will be returned

Example
http://realtime.mbta.com/developer/api/v2/alertheaders?api_key=wX9NwuHnZU2ToO7GmGR9uw&
include_access_alerts=true&include_service_alerts=true&format=json

*/

#define kMBTA_REQ_ALERT_HEADERS @"alertheaders"

+ (NSURL *)requestForAlertHeadersToIncludeAccessAlerts:(bool)includeAccessAlerts
 						    includeServiceAlerts:(bool)includeServiceAlerts;


/*
ALERTHEADERSBYROUTE

This query will return headers for alerts affecting a particular route.
Special Parameters:

route 		GTFS-compatible route_id value for which alert headers should be returned
Data type: String
Example: “931_”MBTA and IBI GROU P

include_access_alerts
(optional)
Whether or not alerts pertaining to accessibility (elevators, escalators) should
be returned
Data type: String representation of Boolean
Possible values: “true” or “false”
Default value: “false”
If not included, then alerts pertaining to accessibility are not returned

include_service_alerts
(optional)
Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”
Default value: “true”
If not included, then service alerts will be returned

Example:
http://realtime.mbta.com/developer/api/v2/alertheadersbyroute?api_key=wX9NwuHnZU2ToO7G
mGR9uw&route=931_&include_access_alerts=true&include_service_alerts=true&format=json
*/

#define kMBTA_REQ_ALERT_HEADERS_BY_ROUTE @"alertheadersbyroute"

+ (NSURL *)requestForAlertHeadersByRoute:(NSString *)route
				     includeAccessAlerts:(bool)includeAccessAlerts
 				    includeServiceAlerts:(bool)includeServiceAlerts;

/*
ALERTHEADERSBYSTOP

This query will return headers for alerts affecting a particular stop.

Special Parameters:

stop GTFS-compatible stop_id value for which alert headers should be
returned
Data type: String
Example: “place-portr”

include_access_alerts
(optional)
Whether or not alerts pertaining to accessibility (elevators, escalators)
should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “false”
If not included, then alerts pertaining to accessibility are not returned

include_service_alerts
(optional)
Whether or not service alerts should be returned
Data type: String representation of Boolean
Possible values: “true” or “false”; default value: “true”
If not included, then service alerts will be returned


Example:
http://realtime.mbta.com/developer/api/v2/alertheadersbystop?api_key=wX9NwuHnZU2ToO7Gm
GR9uw&stop=Porter%20Square&include_access_alerts=true&include_service_alerts=true&form
at=json


*/

#define kMBTA_REQ_ALERT_HEADERS_BY_STOP @"alertheadersbystop"

+ (NSURL *)requestForAlertHeadersByStop:(NSString *)stop
				     includeAccessAlerts:(bool)includeAccessAlerts
 				    includeServiceAlerts:(bool)includeServiceAlerts;


#pragma other requests
// OTHER /////////////////////////////////////////////////////////////////////////////////////////


/*SERVERTIME

This query will return the current server time.

Special Parameters:
None.

Example:
http://realtime.mbta.com/developer/api/v2/servertime?api_key=wX9NwuHnZU2ToO7GmGR9uw&fo
rmat=json
*/
#define kMBTA_REQ_SERVER_TIME @"servertime"

+ (NSURL *)requestServerTime;

+ (NSURL *)constructURLWithPath:(NSString *)path
                     parameters:(NSDictionary *)parameters;



 @end