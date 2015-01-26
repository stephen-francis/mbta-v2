# mbta-v2

mbta-v2 is a wrapper for the MBTA-realtime API, v2. it can perform all requests documented in the MBTA's API, from arrival predictions to alerts.

## Adding to Your Project

if you're using cocoapods, add the following to your podfile:

``` ruby
pod 'mbta-v2'
```

the header for mbta-v2 would be included like so:
```objective-c
#import <mbta-v2.h>
```

mbta-v2 requires ARC, and is for iOS only

### create a request for all the routes available at a given stop, parsing results

```objective-c
[[MBTAClient shared] retrieveRoutesByStop:@"70065" withCompletion:^(NSData *data, NSError *error)
{
    NSArray *routes = [MBTAConverter convertRoutesByStop:data];
    for (MBTARoute *route in routes)
        NSLog(@"%@", route.routeID);
}];

```
in this case, for stop id 70065, which is Porter Square, you'd see the following output:

###931_

###933_

these represent the two Red Line routes that are available at Porter Square, just like you asked for! 

now, you can use these routes to find get the schedule, other stops, train arrival times, and alerts you need to be mindful of.