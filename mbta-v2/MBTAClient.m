//
//  MBTAClient.m

//

#import "MBTAClient.h"

@interface MBTAClient ()
@end

// singleton session obj
static MBTAClient *_sharedMBTAClient = nil;
@implementation MBTAClient
{
    NSURLSession *_session;
    NSString *_apiKey;
}



#pragma mark - Class Methods
+ (MBTAClient *)sharedMBTAClient
{
    return [MBTAClient shared];
}



+ (MBTAClient *)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedMBTAClient = [[self alloc] init];
    });
    return _sharedMBTAClient;
}



- (id)init
{
    if (self = [super init])
    {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

- (void)setApiKey:(NSString *)apiKey
{
    _apiKey = apiKey;
}

- (NSString *)apiKey
{
    if (!_apiKey)
        return kMBTA_TEST_API_KEY;
    
    return _apiKey;
}

- (NSURLSessionDataTask *)fetchContentsOfURL:(NSURL *)url
                                  completion:(MBTAClientCompletion)completionHandler
{
#warning add url nil check?
    
    NSURLSessionDataTask *dataTask =
    [_session dataTaskWithURL:url
            completionHandler:
     
     ^(NSData *data, NSURLResponse *response, NSError *error)
     {
         
         if (!completionHandler)
             return;
         
         if (error)
         {
             completionHandler(nil, error);
             return;
         }
         completionHandler(data, nil);
     }];
    
    [dataTask resume];
    
    return dataTask;
}

@end