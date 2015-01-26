//
//  Constants.h
//  MBTAFramework
//
//  Created by Stephen Francis on 12/18/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#ifndef MBTAFramework_Constants_h
#define MBTAFramework_Constants_h

#define kMBTA_BASE_URL @"http://realtime.mbta.com/developer/api/v2/"

#define kMBTA_TEST_STOP_ID @"70065"
#define kMBTA_TEST_ROUTE_ID @"931_"
#define kMBTA_TEST_ALERT_ID @"781"
#define kMBTA_TEST_TRIP_ID @"CR-Providence-CR-Weekday-807"

#define kMBTA_TEST_LAT 42.380156
#define kMBTA_TEST_LON -71.102744

#define kMBTA_MODE @"mode"
#define kMBTA_MODE_NAME @"mode_name"
#define kMBTA_ROUTE @"route"
#define kMBTA_ROUTE_ID @"route_id"
#define kMBTA_ROUTE_NAME @"route_name"
#define kMBTA_ROUTE_TYPE @"route_type"

#define kMBTA_STOP @"stop"
#define kMBTA_DISTANCE @"distance"
#define kMBTA_PARENT_STATION @"parent_station"
#define kMBTA_PARENT_STATION_NAME @"parent_station_name"
#define kMBTA_STOP_ID @"stop_id"
#define kMBTA_STOP_LAT @"stop_lat"
#define kMBTA_STOP_LON @"stop_lon"
#define kMBTA_STOP_NAME @"stop_name"

#define kMBTA_ROUTE_INFO_DIRECTION @"direction"
#define kMBTA_ROUTE_INFO_DIRECTION_ID @"direction_id"
#define kMBTA_ROUTE_INFO_DIRECTION_NAME @"direction_name"
#define kMBTA_ROUTE_INFO_STOP_ORDER @"stop_order"

#define kMBTA_ERR_HTTP_RES_OK           200
#define kMBTA_ERR_HTTP_RES_BADPARAM     400
#define kMBTA_ERR_HTTP_RES_UNAUTH       401
#define kMBTA_ERR_HTTP_RES_FORBIDDEN    403
#define kMBTA_ERR_HTTP_RES_NOTFOUND     404
#define kMBTA_ERR_HTTP_RES_CANTGETDATA  500
#define kMBTA_ERR_UNKNOWN               1

#define kMBTA_ERR_DESCRIPTION_RES_OK  @"success"
#define kMBTA_ERR_DESCRIPTION_RES_BADPARAM  @"bad parameters, problem fetching data"
#define kMBTA_ERR_DESCRIPTION_RES_UNATH  @"authentication is required, you must authenticate"
#define kMBTA_ERR_DESCRIPTION_RES_FORBIDDEN  @"forbidden: Valid request, denied by server"
#define kMBTA_ERR_DESCRIPTION_RES_NOTFOUND  @"requested resource could not be found"
#define kMBTA_ERR_DESCRIPTION_RES_CANTGETDATA  @"problem occurred internally on server"
#define kMBTA_ERR_DESCRIPTION_UNKNOWN  @"unknown error"

#endif
