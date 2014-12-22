//
//  MBTAClient.h

//
#import <Foundation/Foundation.h>

#define kMBTA_TEST_API_KEY @"wX9NwuHnZU2ToO7GmGR9uw"
@interface MBTAClient : NSObject


typedef void (^MBTAClientCompletion)(NSData *data, NSError *error);

+ (MBTAClient *)shared;
+ (MBTAClient *)sharedMBTAClient;
- (NSURLSessionDataTask *)fetchContentsOfURL:(NSURL *)url
                completion:(MBTAClientCompletion)completionHandler;

- (NSString *)apiKey;
- (void)setApiKey:(NSString *)apiKey;

@end