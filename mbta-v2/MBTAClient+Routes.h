//
//  MBTAClient+Routes.h
//
//

#import "MBTAClient.h"

@interface MBTAClient (Routes)

- (NSURLSessionDataTask *)retrieveRoutesWithCompletion:(MBTAClientCompletion)completion;
- (NSURLSessionDataTask *)retrieveRoutesByStop:(NSString *)stopID
                                withCompletion:(MBTAClientCompletion)completion;

@end