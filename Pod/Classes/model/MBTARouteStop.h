//
//  MBTARouteStop.h
//  Pods
//
//  Created by Stephen Francis on 12/19/14.
//
//

#import "MBTAStop.h"

@class MBTARouteInfo;

@interface MBTARouteStop : MBTAStop

@property (nonatomic, strong) MBTARouteInfo *routeInfo;

@end
