//
//  MBTAStop.h
//  MBTAFramework
//
//  Created by Stephen Francis on 12/17/14.
//  Copyright (c) 2014 SFra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBTAStop : NSObject

@property (nonatomic, strong) NSNumber *distance;
@property (nonatomic, strong) NSString *parentStation;
@property (nonatomic, strong) NSString *parentStationName;
@property (nonatomic, strong) NSString *stopID;
@property (nonatomic, strong) NSNumber *stopLat;
@property (nonatomic, strong) NSNumber *stopLon;
@property (nonatomic, strong) NSString *stopName;

@end