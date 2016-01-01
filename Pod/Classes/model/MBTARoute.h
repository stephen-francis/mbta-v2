//
//  MBTARoute.h
//  NextBusTest
//
//  Created by Stephen Francis on 4/8/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

//#import "MBTAStop.h"
#import <Foundation/Foundation.h>

@interface MBTARoute : NSObject

typedef enum
{
    subwayGreen,
    subway,
    commuterRail,
    bus,
    boat
} MBTARouteType;

@property (nonatomic, assign) MBTARouteType routeType;
@property (nonatomic, strong) NSString *modeName;
@property (nonatomic, strong) NSString *routeID;
@property (nonatomic, strong) NSString *routeName;
@property (nonatomic, assign) bool routeHide;

@property (strong, nonatomic) NSArray *trips;

@end

/* MBTARouteInfo *
 * a stop that is associated with an MBTARoute is an MBTARouteStop, it has a
 * direction and a stop order associated with it. for instance, it could be the
 * 5th stop, heading in directionID = 1, which is directionName = @"Northbound"
 */
@interface MBTARouteInfo : NSObject

@property (nonatomic, strong) NSString *routeID;
@property (nonatomic, strong) NSNumber *directionID;
@property (nonatomic, strong) NSString *directionName;
@property (nonatomic, strong) NSNumber *stopOrder;

@end