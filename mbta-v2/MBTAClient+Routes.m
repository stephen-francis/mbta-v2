//
//  MBTAClient+Routes.m
//

#import "MBTAClient+Requests.h"
#import "MBTAClient+Routes.h"

@implementation MBTAClient (Routes)

- (NSURLSessionDataTask *)retrieveRoutesWithCompletion:(MBTAClientCompletion)completion
{
	return [self fetchContentsOfURL:[MBTAClient requestForRoutes]
				  	     completion:completion];
}



- (NSURLSessionDataTask *)retrieveRoutesByStop:(NSString *)stopID
							  withCompletion:(MBTAClientCompletion)completion
{
	return [self fetchContentsOfURL:[MBTAClient requestForRoutesByStop:stopID]
				  	     completion:completion];
}

@end