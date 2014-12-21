//
//  MBTARouteStop.m
//  Pods
//
//  Created by Stephen Francis on 12/19/14.
//
//

#import "MBTARoute.h"
#import "MBTARouteStop.h"

@implementation MBTARouteStop

- (id)init
{
    self = [super init];
    if (self)
    {
        self.routeInfo = [[MBTARouteInfo alloc] init];
    }
    return self;
}

@end
