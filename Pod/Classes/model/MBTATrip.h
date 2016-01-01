//
//  MBTATrip.h
//  Pods
//
//  Created by Stephen Francis on 12/19/14.
//
//

#import <Foundation/Foundation.h>

@interface MBTATrip : NSObject

/*
 * a trip has MBTATripStops that it will arrive at, at a predicted time. these
 * stops will have MBTATripInfo that indicates when this will happen, and which
 * MBTATrip they are associated with
*/
@property (strong, nonatomic) NSArray *stops;

@end


/*
 * MBTATripInfo
 * if this stop was retrieved in connection with a trip, this info indicates when
 * the train following the trip will arrive at the stop, and identifying info
 * about the trip
 */
@interface MBTATripInfo : NSObject

@property (nonatomic, strong) NSNumber *scheduleArrivalDateTime;
@property (nonatomic, strong) NSNumber *scheduleDepartureDateTime;
@property (nonatomic, strong) NSNumber *stopSequence;
@property (nonatomic, strong) NSString *tripID;
@property (nonatomic, strong) NSString *tripName;

@end