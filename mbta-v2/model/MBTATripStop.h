//
//  MBTATripStop.h
//  Pods
//
//  Created by Stephen Francis on 12/19/14.
//
//

#import "MBTAStop.h"

@class MBTATripInfo;

@interface MBTATripStop : MBTAStop

@property (nonatomic, strong) MBTATripInfo *tripInfo;

@end
