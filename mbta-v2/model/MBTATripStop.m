//
//  MBTATripStop.m
//  Pods
//
//  Created by Stephen Francis on 12/19/14.
//
//

#import "MBTATrip.h"
#import "MBTATripStop.h"

@implementation MBTATripStop

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tripInfo = [[MBTATripInfo alloc] init];
    }
    return self;
}

@end
