//
//  MBTAClient.m

//

#import "Constants.h"
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
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfig.allowsCellularAccess = YES;
        sessionConfig.timeoutIntervalForRequest = 30.0;
        sessionConfig.timeoutIntervalForResource = 60.0;
        _session = [NSURLSession sessionWithConfiguration:sessionConfig];
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

/* 
 * creates an HTTP get request task for the specified URL. this task is managed
 * by our client's session, the task is resumed before it is returned. the task
 * is returned so that it can be modified (suspended, for example). a completion
 * handler must be specified so that the response can be handled when the async
 * request is completed by the client: the client needs to know what to do with
 * the data it has retrieved.
 *
 * an example of its use is below, you can see that the URL, which specifies the
 * MBTA API query, is created by the client category for the associated feature
 * (schedule retrieval, so this requets lives in MBTAClient+Schedule):
 *
 * return [self fetchContentsOfURL:[MBTAClient requestForScheduleByTrip:trip
 *                        dateTime:dateTime]
 *                      completion:completion];
 */
- (NSURLSessionDataTask *)fetchContentsOfURL:(NSURL *)url
                                  completion:(MBTAClientCompletion)completionHandler
{
    if (!url)
        return nil;
    
    NSURLSessionDataTask *dataTask =
    [_session dataTaskWithURL:url
            completionHandler:
     
     ^(NSData *data, NSURLResponse *response, NSError *error)
     {
         if (!completionHandler)
             return;
         
         // handle response's code if there's no data retrieval error
         if (!error)
         {
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
             // verify that http status code is OK
             // we could have no error, but a bad response code
             NSError *httpResponseError = [self errorForResponse:httpResponse];
             completionHandler(data, httpResponseError);
             
         }
         else
         {
             completionHandler(nil, error);
             return;
         }
     }];
    
    [dataTask resume];
    
    return dataTask;
}

// evals response of fetching data from URL to see if there is an HTTP response
// code, and creates an error based on the code if the code is valid
- (NSError *)errorForResponse:(NSURLResponse *)httpResponse
{
    if (!httpResponse)
        return [MBTAClient errorForCode:kMBTA_ERR_UNKNOWN];
    
    NSInteger responseCode = 1;
    if ([httpResponse respondsToSelector:@selector(statusCode)])
    {
        NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)httpResponse;
        responseCode = [httpURLResponse statusCode];
    }
    return [MBTAClient errorForCode:responseCode];
}

// creates an error with mbta-v2 domain, error code, and associated explanation
+ (NSError *)errorForCode:(NSInteger)errorCode
{
    if (kMBTA_ERR_HTTP_RES_OK == errorCode)
        return nil;
    
    return [NSError errorWithDomain:@"edu.self.mbta-v2" code:errorCode userInfo:@{@"Error reason": [MBTAClient errorReasonForCode:errorCode]}];
}

// provide an explanation for a given http response code
+ (NSString *)errorReasonForCode:(NSInteger)errorCode
{
    NSString *errorDescription;
    switch (errorCode)
    {
        case kMBTA_ERR_HTTP_RES_BADPARAM:
            errorDescription = kMBTA_ERR_DESCRIPTION_RES_BADPARAM;
        case kMBTA_ERR_HTTP_RES_UNAUTH:
            errorDescription = kMBTA_ERR_DESCRIPTION_RES_UNATH;
        case kMBTA_ERR_HTTP_RES_FORBIDDEN:
            errorDescription = kMBTA_ERR_DESCRIPTION_RES_FORBIDDEN;
        case kMBTA_ERR_HTTP_RES_NOTFOUND:
            errorDescription = kMBTA_ERR_DESCRIPTION_RES_NOTFOUND;
        case kMBTA_ERR_HTTP_RES_CANTGETDATA:
            errorDescription = kMBTA_ERR_DESCRIPTION_RES_CANTGETDATA;
        default:
            errorDescription = kMBTA_ERR_DESCRIPTION_UNKNOWN;
    }
    
    return errorDescription;
}

@end